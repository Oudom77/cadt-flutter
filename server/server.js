const express = require("express");
const jwt = require("jsonwebtoken");

const app = express();
app.use(express.json());

const SECRET = "my-secret-key";

// -------------------- LOGIN --------------------

app.post("/login", (req, res) => {
    const { username, password } = req.body;

    console.log("POST /login", username);

    // Very simple authentication
    if (username !== "john" || password !== "1234") {
        console.log("  -> Invalid credentials");
        return res.status(401).json({ error: "Invalid credentials" });
    }

    const token = jwt.sign(
        { id: "001", username: username, role: "student" },
        SECRET,
        { expiresIn: "2m" }
    );

    console.log("  -> JWT created");

    res.json({ token });
});

// ---------------- PROTECTED API ----------------

app.get("/employees", (req, res) => {

    console.log("GET /employees");

    const auth = req.headers.authorization;

    if (!auth) {
        console.log("  -> No Authorization header");
        return res.status(401).json({ error: "No token" });
    }

    const token = auth.split(" ")[1];

    try {

        const user = jwt.verify(token, SECRET);

        console.log("  -> Token OK for", user.username);

        res.json([
            { id: 1, name: "Alice" },
            { id: 2, name: "Bob" },
            { id: 3, name: "Charlie" }
        ]);

    } catch (err) {

        console.log("  -> Invalid token");

        res.status(401).json({ error: "Invalid token" });
    }

});

app.listen(3000, () =>
    console.log("Server running on http://localhost:3000")
);
