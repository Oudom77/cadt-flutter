const cors = require("cors");
const express = require("express");
const jwt = require("jsonwebtoken");

const app = express();
const port = process.env.PORT || 3000;
const secret = process.env.JWT_SECRET || "my-secret-key";

app.use(cors());
app.use(express.json());

const users = [
    {
        id: "001",
        name: "John",
        username: "john",
        email: "john@example.com",
        password: "1234",
        role: "student",
    },
    {
        id: "002",
        name: "Koala",
        username: "koala",
        email: "koala@example.com",
        password: "5678",
        role: "student",
    },
    {
        id: "003",
        name: "Capy",
        username: "capy",
        email: "capy@example.com",
        password: "9012",
        role: "student",
    },
];

const scores = [
    { id: "score-001", userId: "001", title: "Dart Basics", value: 88 },
    { id: "score-002", userId: "001", title: "Flutter Layout", value: 92 },
    { id: "score-003", userId: "002", title: "Dart Basics", value: 74 },
    { id: "score-004", userId: "002", title: "Flutter Layout", value: 81 },
    { id: "score-005", userId: "003", title: "Dart Basics", value: 95 },
    { id: "score-006", userId: "003", title: "Flutter Layout", value: 89 },
];

function authenticateToken(req, res, next) {
    const authorization = req.headers.authorization;

    if (!authorization) {
        return res.status(401).json({ error: "Authorization header is required" });
    }

    const [scheme, token] = authorization.split(" ");

    if (scheme !== "Bearer" || !token) {
        return res.status(401).json({ error: "Authorization must use a Bearer token" });
    }

    try {
        req.user = jwt.verify(token, secret);
        next();
    } catch (error) {
        const message = error.name === "TokenExpiredError"
            ? "Token has expired"
            : "Token is invalid";

        return res.status(401).json({ error: message });
    }
}

app.get("/health", (req, res) => {
    res.json({ status: "ok" });
});

app.post("/login", (req, res) => {
    const { username, email, password } = req.body ?? {};
    const loginIdentifier = email ?? username;

    if (typeof loginIdentifier !== "string" || typeof password !== "string") {
        return res.status(400).json({ error: "Username/email and password are required" });
    }

    const normalizedIdentifier = loginIdentifier.trim().toLowerCase();
    const user = users.find(
        (candidate) =>
            (candidate.username.toLowerCase() === normalizedIdentifier ||
                candidate.email.toLowerCase() === normalizedIdentifier) &&
            candidate.password === password,
    );

    if (!user) {
        return res.status(401).json({ error: "Invalid credentials" });
    }

    const token = jwt.sign(
        {
            id: user.id,
            name: user.name,
            username: user.username,
            role: user.role,
        },
        secret,
        { expiresIn: "2m" },
    );

    return res.json({ token });
});

app.get("/scores", authenticateToken, (req, res) => {
    const userScores = scores
        .filter((score) => score.userId === req.user.id)
        .map((score) => ({ title: score.title, value: score.value }));

    return res.json(userScores);
});

app.use((req, res) => {
    res.status(404).json({ error: "Route not found" });
});

app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});
