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
  const [currentWeight, setCurrentWeight] = useState("");
  const [currentReps, setCurrentReps] = useState("");
  const [completedSets, setCompletedSets] = useState([]);
  const [completedReps, setCompletedReps] = useState({});
  const [completedWeight, setCompletedWeight] = useState({});

  console.log("(1)the user inside the workoutProfiles COMP is:", user);

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
    } catch (error) {
      console.error("Error fetching workout data:", error);
      setError("An error occurred while fetching workout data.");
    }
  };

  console.log("(6)the workoutName after the if array is:", workout);

  useEffect(() => {
    console.log("Workout state has changed:", workout);
  }, [workout]);

  useEffect(() => {
    fetchData();
  }, [user.id]);

  // const handleSetChange = (e) => {
  //   if (e.target.name === "weight") {
  //     setCurrentWeight(e.target.value);
  //   } else if (e.target.name === "reps") {
  //     setCurrentReps(e.target.value);
  //   }
  // };

  const handleSaveSet = async (
    dayIndex,
    exerciseIndex,
    setIndex,
    exerciseId
  ) => {
    const setToSave = {
      exercise_id: exerciseId,
      weight: completedWeight[`${dayIndex}-${exerciseIndex}-${setIndex}`],
      reps: completedReps[`${dayIndex}-${exerciseIndex}-${setIndex}`],
    };

    try {
      const response = await fetch("/sets_completeds", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(setToSave),
      });

      if (response.status === 200) {
        console.log("Set saved successfully!");

        const updatedWorkout = { ...workout };

        const updatedExercise =
          updatedWorkout.day[dayIndex].exercises[exerciseIndex];

        updatedExercise.completed_sets.push(setToSave);

        setWorkout(updatedWorkout);

        setCurrentWeight("");
        setCurrentReps("");

        fetchData();
      } else {
        console.error("Error saving set:", response.statusText);
      }
    } catch (error) {
      console.error("Error saving set:", error);
    }
    fetchData();
  };

  return (
    <div>
      <h1>Workout Profile</h1>
      <h2>Workout ID: {workout.id}</h2>
      <h2>Workout Name: {workout.name}</h2>

      {workout.day.map((day, dayIndex) => (
        <div key={day.id}>
          <h3>Day Number: {day.dayNumber}</h3>

          {day.exercises.map((exercise, exerciseIndex) => (
            <div key={exercise.id}>
              <h4>Exercise: {exercise.name}</h4>

              {exercise.prescribed_sets.map((set, setIndex) => (
                <div key={set.id}>
                  <p
                    style={{ fontWeight: "bold", textDecoration: "underline" }}
                  >
                    Prescribed weight:{" "}
                  </p>
                  <p>Weight: {set.weight}</p>
                  <p>Reps: {set.reps}</p>
                  <p>Exercise ID: {exercise.id}</p>

                  <p
                    style={{ fontWeight: "bold", textDecoration: "underline" }}
                  >
                    Completed Weight:
                  </p>
                  <input
                    type="text"
                    name="weight"
                    value={
                      completedWeight[
                        `${dayIndex}-${exerciseIndex}-${setIndex}`
                      ] || ""
                    }
                    onChange={(e) => {
                      const key = `${dayIndex}-${exerciseIndex}-${setIndex}`;
                      setCompletedWeight((prevState) => ({
                        ...prevState,
                        [key]: e.target.value,
                      }));
                    }}
                  />
                  <p
                    style={{ fontWeight: "bold", textDecoration: "underline" }}
                  >
                    Completed Reps:
                  </p>
                  <input
                    type="text"
                    name="reps"
                    value={
                      completedReps[
                        `${dayIndex}-${exerciseIndex}-${setIndex}`
                      ] || ""
                    }
                    onChange={(e) => {
                      const key = `${dayIndex}-${exerciseIndex}-${setIndex}`;
                      setCompletedReps((prevState) => ({
                        ...prevState,
                        [key]: e.target.value,
                      }));
                    }}
                  />
                  <button
                    onClick={() =>
                      handleSaveSet(
                        dayIndex,
                        exerciseIndex,
                        setIndex,
                        exercise.id
                      )
                    }
                  >
                    Save
                  </button>
                  {exercise.completed_sets.map((completedSet, index) => (
                    <div key={index}>
                      <p
                        style={{
                          fontWeight: "bold",
                          textDecoration: "underline",
                        }}
                      >
                        Completed Set {index + 1}:
                      </p>
                      <p>Weight: {completedSet.weight}</p>
                      <p>Reps: {completedSet.reps}</p>
                    </div>
                  ))}
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
