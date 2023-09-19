import React, { useEffect, useState } from "react";
import { Routes, Route } from "react-router-dom";
import SignUp from "./SignUp";
import Login from "./Login";
import NavBar from "./NavBar";
import styles from "./workoutProfiles.module.css";

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

  const handleSaveSet = async (dayIndex, exerciseIndex, exerciseId) => {
    const setToSave = {
      exercise_id: exerciseId,
      weight: completedWeight[`${dayIndex}-${exerciseIndex}`],
      reps: completedReps[`${dayIndex}-${exerciseIndex}`],
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
      } else {
        console.error("Error saving set:", response.statusText);
        fetchData();
      }
    } catch (error) {
      console.error("Error saving set:", error);
    }
  };

  return (
    <div className={styles["workout-profile-container"]}>
      <h1 className={styles["workout-profile-heading"]}>Workout Profile</h1>
      <h2 className={styles["workout-profile-heading"]}>
        {workout.name}, please find your AI generated workout below
      </h2>

      {workout.day.map((day, dayIndex) => (
        <div key={day.id} className={styles["workout-profile-cards"]}>
          {/* Left Card for Day Number */}
          <div className={styles["workout-profile-card"]}>
            <h3 className={styles["workout-profile-card-heading"]}>
              Day Number: {day.dayNumber}
            </h3>
          </div>

          {/* Center Card for Prescribed Reps */}
          <div className={styles["workout-profile-card"]}>
            <h3 className={styles["workout-profile-card-heading"]}>
              Prescribed Reps
            </h3>
            {day.exercises.map((exercise, exerciseIndex) => (
              <div key={exercise.id}>
                <h4 className={styles["workout-profile-exercise-name"]}>
                  Exercise: {exercise.name}
                </h4>
                {exercise.prescribed_sets.map((set, setIndex) => (
                  <div key={set.id}>
                    <p className={styles["workout-profile-prescribed-info"]}>
                      <b>Prescribed weight {set.id}:</b> {set.weight} Kgs
                    </p>
                    <p className={styles["workout-profile-info"]}>
                      <b>Reps:</b> {set.reps} reps
                    </p>
                  </div>
                ))}
              </div>
            ))}
          </div>

          {/* Right Card for Completed Reps and Sets */}
          <div className={styles["workout-profile-card"]}>
            <h3 className={styles["workout-profile-card-heading"]}>
              Completed Reps and Sets
            </h3>
            {day.exercises.map((exercise, exerciseIndex) => (
              <div key={exercise.id}>
                <h4 className={styles["workout-profile-exercise-name"]}>
                  Exercise: {exercise.name}
                </h4>
                {/* Input field for Completed Weight */}
                <p className={styles["workout-profile-prescribed-info"]}>
                  Completed Weight for exercise:
                </p>
                <input
                  className={styles["workout-profile-input"]}
                  type="text"
                  name="weight"
                  value={completedWeight[`${dayIndex}-${exerciseIndex}`] || ""}
                  onChange={(e) => {
                    const key = `${dayIndex}-${exerciseIndex}`;
                    setCompletedWeight((prevState) => ({
                      ...prevState,
                      [key]: e.target.value,
                    }));
                  }}
                />
                {/* Input field for Completed Reps */}
                <p className={styles["workout-profile-prescribed-info"]}>
                  Completed Reps for exercise:
                </p>
                <input
                  className={styles["workout-profile-input"]}
                  type="text"
                  name="reps"
                  value={completedReps[`${dayIndex}-${exerciseIndex}`] || ""}
                  onChange={(e) => {
                    const key = `${dayIndex}-${exerciseIndex}`;
                    setCompletedReps((prevState) => ({
                      ...prevState,
                      [key]: e.target.value,
                    }));
                  }}
                />
                <button
                  className={styles["workout-profile-save-button"]}
                  onClick={() =>
                    handleSaveSet(dayIndex, exerciseIndex, exercise.id)
                  }
                >
                  Save
                </button>
                {/* Display completed set for this exercise */}
                {exercise.completed_sets.map((completedSet, index) => (
                  <div key={index}>
                    <p className={styles["workout-profile-completed-set"]}>
                      Completed Set {index + 1}:
                    </p>
                    <p className={styles["workout-profile-info"]}>
                      Weight: {completedSet.weight} Kg
                    </p>
                    <p className={styles["workout-profile-info"]}>
                      Reps: {completedSet.reps} reps
                    </p>
                  </div>
                ))}
              </div>
            ))}
          </div>
        </div>
      ))}
    </div>
  );
}

export default WorkoutProfiles;
