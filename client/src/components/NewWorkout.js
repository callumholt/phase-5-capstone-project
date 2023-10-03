import React, { useEffect, useState } from "react";

function NewWorkout({ setUser }) {
  const [newWorkout, setNewWorkout] = useState(""); // Fixed variable names
  const [error, setError] = useState("");

  useEffect(() => {
    console.log("NewWorkout is:", NewWorkout);
  }, [NewWorkout]);

  function handleSubmit(e) {
    e.preventDefault();
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

// import React, { useState } from "react";

// function NewWorkout({ setUser }) {
//   const [NewWorkout, SetNewWorkout] = useState("");
//   const [error, setError] = useState("");

//   function handleSubmit(e) {
//     e.preventDefault();
//     fetch("/login", {
//       method: "POST",
//       headers: {
//         "Content-Type": "application/json",
//       },
//       body: JSON.stringify({ NewWorkout }),
//     })
//       .then((r) => {
//         if (r.ok) {
//           console.log("successfully created workout")
//           }
//         } else {
//           throw new Error("Errow in creating New Workout")
//         }
//       );
//       .catch((error) => {
//         alert(error.message);
//       })
//   }

//   return (
//     <div>
//       <form onSubmit={handleSubmit}>
//         <h1>Create New Workout Below</h1>
//         <label htmlFor="workout">Workout</label>
//         <input
//           type="text"
//           id="workout"
//           autoComplete="off"
//           value={workout}
//           onChange={(e) => SetNewWorkout(e.target.value)}
//         />
//         <button type="submit">Submit Workout</button>
//       </form>
//     </div>
//   );
// }

// export default NewWorkout;
