import React, { useState, useEffect } from "react";
import { redirect, useHistory } from "react-router-dom";

function SignUp({ user, setUser }) {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [redirect, setRedirect] = useState(false);

  const [password, setPassword] = useState("");
  const [passwordConfirmation, setPasswordConfirmation] = useState("");

  useEffect(
    (redirect) => {
      console.log("inside useEffect");
      console.log("value of redirect:", redirect);

      if (redirect) {
        window.location.href = "http://localhost:4000/";
        console.log("after redirect");
        console.log("value of redirect:", redirect);
      }
    },
    [redirect]
  );

  function handleSubmit(e) {
    e.preventDefault();
    fetch("/signup", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        name,
        email,
        password,
        password_confirmation: passwordConfirmation,
      }),
    }).then((r) => {
      if (r.ok) {
        return r.json().then((user) => {
          setUser(user);
          setRedirect(true);
          console.log("the user (signup comp) is: ", user);
          console.log("user truthy?: ", user ? "truthy" : "falsy");
        });
      } else {
        alert("It looks like the passwords didnt match, try again");
        // throw new Error("Sign up failed");
      }
    });
  }

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <h1>Sign Up</h1>
        <label htmlFor="name">Name</label>
        <input
          type="text"
          id="name"
          autoComplete="off"
          value={name}
          onChange={(e) => setName(e.target.value)}
        />
        <label htmlFor="email">Email</label>
        <input
          type="email"
          id="email"
          autoComplete="off"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
        <label htmlFor="password">Password</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          autoComplete="current-password"
        />
        <label htmlFor="password">Password Confirmation</label>
        <input
          type="password"
          id="password_confirmation"
          value={passwordConfirmation}
          onChange={(e) => setPasswordConfirmation(e.target.value)}
          autoComplete="current-password"
        />
        <button type="submit">Sign Up</button>
      </form>
    </div>
  );
}

export default SignUp;
