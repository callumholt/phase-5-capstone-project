import React, { useEffect, useState } from "react";

function NewWorkout({ setUser }) {
  const [newWorkout, setNewWorkout] = useState(""); // Fixed variable names
  const [error, setError] = useState("");

  useEffect(() => {
    console.log("NewWorkout is:", NewWorkout);
  }, [NewWorkout]);

  function handleSubmit(e) {
    e.preventDefault();
    console.log(
      "Thank you for submitting your details, we will take 60 seconds to generate your workout!"
    );
    alert(
      "Thank you for submitting your details, we will take 60 seconds to generate your workout!"
    );
    fetch("/workouts/", {
      // Fixed the API endpoint
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ newWorkout }),
    })
      .then((r) => {
        if (r.ok) {
          console.log("Successfully created workout");
        } else {
          // throw new Error("Error in creating New Workout");
          console.log(
            "It looks like you encountered a bug in the system, please try again"
          );
          alert(
            "It looks like you encountered a bug in the system, please try again"
          );
        }
      })
      .catch((error) => {
        alert(
          "It looks like you encountered a bug in the system, please try again"
        );
      });
  }

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <h1>Create New Workout Below</h1>
        <label htmlFor="workout">Workout</label>
        <input
          type="text"
          id="workout"
          autoComplete="off"
          value={newWorkout} // Fixed variable name
          onChange={(e) => setNewWorkout(e.target.value)} // Fixed variable name
        />
        <button type="submit">Submit Workout</button>
      </form>
    </div>
  );
}

export default NewWorkout;
