import React, { useEffect, useState } from "react";
import { Routes, Route } from "react-router-dom";
import SignUp from "./SignUp";
import Login from "./Login";
import NavBar from "./NavBar";

function WorkoutProfiles({ user }) {
  const [workout, setWorkout] = useState({
    id: null,
    name: "",
    day: [],
  });

  const [error, setError] = useState(null);
  console.log("(1)the user inside the workoutProfiles COMP is:", user);

  useEffect(() => {
    const fetchData = async () => {
      try {
        console.log("(2)the user.id that goes into the fetch is:", user.id);

        const response = await fetch(`/workouts/${user.id}`);
        console.log("(3)the response from the fetch is:", response);

        const data = await response.json();
        console.log("(3.5)the response after getting json'ified:", data);
        console.log(
          "(3.75)the response after getting json'ified, type:",
          typeof data
        );

        setWorkout(data);
        console.log("(4)the workout after being set is:", workout);

        // const additionalResponse = await fetch("/exercises");
        // const additionalData = await additionalResponse.json();
        // setAdditionalData(additionalData);
      } catch (error) {
        console.error("Error fetching workout data:", error);
        setError("An error occurred while fetching workout data.");
      }
    };

    fetchData();
  }, [user.id]);

  console.log("(6)the workoutName after the if array is:", workout);

  useEffect(() => {
    console.log("Workout state has changed:", workout);
  }, [workout]);

  return (
    <div>
      <h1>Workout Profile</h1>
      <h2>Workout ID: {workout.id}</h2>
      <h2>Workout Name: {workout.name}</h2>

      {/* Render the "day" information */}
      {workout.day.map((day) => (
        <div key={day.id}>
          <h3>Day Number: {day.dayNumber}</h3>

          {/* Render exercises for the day */}
          {day.exercises.map((exercise) => (
            <div key={exercise.id}>
              <h4>Exercise: {exercise.name}</h4>

              {/* Render prescribed sets for the exercise */}
              {exercise.prescribed_sets.map((set) => (
                <div key={set.id}>
                  <p>Weight: {set.weight}</p>
                  <p>Reps: {set.reps}</p>
                </div>
              ))}
            </div>
          ))}
        </div>
      ))}
    </div>
  );
}
export default WorkoutProfiles;
