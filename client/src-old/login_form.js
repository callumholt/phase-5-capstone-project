import React, { useState } from "react";

function LoginForm() {
  const [email, setEmail] = useState("");

  const handleSubmit = async (event) => {
    event.preventDefault();

    // Uncomment the following code when you're ready to send the data to the server
    /*
    const response = await fetch("http://localhost:4567/todo", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        todo: todo,
        category: category,
        user: user,
      }),
    });

    if (response.ok) {
      console.log("Data successfully sent to the database!");
      alert("Data successfully sent to the database!");
    } else {
      console.error("Error sending data to the database:", response.status);
    }
    */
  };

  return (
    <div>
      <h2>Please enter your email to login:</h2>

      <form onSubmit={handleSubmit}>
        <label>
          Email:
          <input
            type="text"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </label>
        {/* 
        Uncomment the following code when you're ready to add the category and user inputs
        <br />
        <label>
          Category:
          <input
            type="text"
            value={category}
            onChange={(e) => setCategory(e.target.value)}
          />
        </label>
        <br />
        <label>
          User:
          <input
            type="text"
            value={user}
            onChange={(e) => setUser(e.target.value)}
          />
        </label>
        <br />
        */}
        <button type="submit">Submit</button>
      </form>
    </div>
  );
}

export default LoginForm;
