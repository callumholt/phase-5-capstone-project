import React, { useEffect, useState } from "react";

const WorkoutProfiles = () => {
  const [workouts, setWorkouts] = useState([]);
  const [additionalData, setAdditionalData] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetchData();
    console.log("the workout in the react comp is:", workouts);
  }, []);

  useEffect(() => {
    console.log("Workouts in the react comp in state:", workouts);
  }, [workouts]);

  useEffect(() => {
    console.log("additional data in the react comp in state:", additionalData);
  }, [additionalData]);

  const fetchData = async () => {
    try {
      const response = await fetch("/workouts");
      const data = await response.json();
      setWorkouts(data);
      console.log("the data inside of the fetch is:", data);
      console.log("Workout data was retrieved");

      const additionalResponse = await fetch("/exercises");
      const additionalData = await additionalResponse.json();
      setAdditionalData(additionalData);
    } catch (error) {
      console.error("Error fetching workout data:", error);
      setError("An error occurred while fetching workout data.");
    }
  };

  useEffect(() => {
    fetchData();
    console.log("the workout is:", workouts);
  }, []);

  useEffect(() => {
    console.log("Workouts in state:", workouts);
  }, [workouts]);

  return (
    <div>
      <h1>Workout Profiles</h1>
      {workouts.map((workout) => (
        <div key={workout.id}>
          <h2>Workout Name: {workout.name}</h2>

          {workout.day.map((day) => (
            <div key={day.id}>
              <h3>Day: {day.dayNumber}</h3>

              {additionalData.map((exercise) => {
                if (exercise.day.id === day.id) {
                  return (
                    <div key={exercise.id}>
                      <h4>Exercise: {exercise.name}</h4>

                      {exercise.prescribed_sets.map((set) => (
                        <div key={set.id}>
                          <h5>Set {set.id}</h5>
                          <p>Weight: {set.weight}</p>
                          <p>Reps: {set.reps}</p>
                        </div>
                      ))}
                    </div>
                  );
                }
                return null;
              })}
            </div>
          ))}
        </div>
      ))}
    </div>
  );
};

export default WorkoutProfiles;

// return (
//   <div>
//     <h1>Workout Profiles</h1>
//     {workouts.map((workout) => (
//       <div key={workout.id}>
//         <h2>Workout Name: {workout.name}</h2>

//         {workout.day.map((day) => (
//           <div key={day.id}>
//             <h3>Day: {day.dayNumber}</h3>

//             {/* {day.exercises.map((exercise) => (
//               <div key={exercise.id}>
//                 <h4>Exercise: {exercise.name}</h4>

//                 {exercise.prescribed_sets.map((set) => (
//                   <div key={set.id}>
//                     <p>Weight: {set.weight}</p>
//                     <p>Reps: {set.reps}</p>
//                   </div>
//                 ))}
//               </div>
//             ))} */}
//           </div>
//         ))}
//       </div>
//     ))}
//   </div>
// );

// import React, { useEffect, useState } from "react";

// const WorkoutProfiles = () => {
//   const [workouts, setWorkouts] = useState([]);

//   useEffect(() => {
//     fetchData();
//   }, []);

//   const fetchData = async () => {
//     try {
//       const response = await fetch("/workouts"); // Update the API endpoint
//       const data = await response.json();
//       setWorkouts(data);
//       console.log("Data is:", data);
//       console.log("workouts is:", workouts);
//       console.log("Workout data was retrieved");
//     } catch (error) {
//       console.error("Error fetching workout data:", error);
//     }
//   };

//   return (
//     <div>
//       <h1>Workout Profiles</h1>
//       {workouts.map((workout) => (
//         <div key={workout.id}>
//           <h2>Workout Name: {workout.name}</h2>
//           <p>User: {workout.user.name}</p>
//           <p>Days: {workout.user.days}</p>
//         </div>
//       ))}
//     </div>
//   );
// };

// //   return (
// //     <div>
// //       <p>Please see the workouts below:</p>

// //       {/* <div>
// //         {workouts.map((workout) => (
// //           <div>
// //             <h2>Workout name: {workout.name}</h2>
// //             <p>User: {workout.user.name}</p>
// //           </div>

// //         ))}
// //       </div> */}

// //       <div>
// //         {workouts.map((workout) => (
// //           <div key={workout.id}>
// //             <h2>Workout: {workout.name}</h2>
// //             <p>User: {workout.user.name}</p>
// //           </div>

// //               {/* {workout.day.map((day) => (
// //                 <div key={day.id}>
// //                   <h3>Day {day.dayNumber}</h3>
// //                   <div>
// //                     {day.exercises.map((exercise) => (
// //                       <div key={exercise.id}>
// //                         <h4>Exercise: {exercise.name}</h4>
// //                         <div>
// //                           {exercise.sets_prescribed.map((set) => (
// //                             <div key={set.id}>
// //                               <p>Weight: {set.weight}</p>
// //                               <p>Reps: {set.reps}</p>
// //                             </div>
// //                           ))}
// //                         </div>
// //                       </div>
// //                     ))}
// //                   </div>
// //                 </div>
// //               ))} */}
// //             </div>
// //           </div>
// //         ))}
// //       </div>
// //       <p>Please see the workouts above!</p>
// //     </div>
// //   );
// // };

// export default WorkoutProfiles;

// // DOGPROFILES BELOW:

// // import React, { useEffect, useState } from "react";

// // const DogProfiles = () => {
// //   const [dogs, setDogs] = useState([]);

// //   useEffect(() => {
// //     fetchData();
// //   }, []);

// //   const fetchData = async () => {
// //     try {
// //       const response = await fetch("/dogs");
// //       const data = await response.json();
// //       setDogs(data);
// //       console.log(data);
// //       console.log(dogs);
// //       console.log("the dog data was retrieved");
// //     } catch (error) {
// //       console.error("Error fetching dog data:", error);
// //     }
// //   };

// //   function handleDelete(e, dogId) {
// //     e.preventDefault();
// //     fetch(`/dogs/${dogId}`, {
// //       method: "DELETE",
// //     })
// //       .then((response) => {
// //         if (response.ok) {
// //           console.log("The dog was successfully deleted");
// //           fetchData();
// //         } else {
// //           throw new Error("Deletion failed");
// //         }
// //       })
// //       .catch((error) => {
// //         console.error(error);
// //       });
// //   }

// //   return (
// //     <div>
// //       <p>Please see the dogs below:</p>
// //       <div>
// //         {dogs.map((dog) => (
// //           <form onSubmit={handleDelete}>
// //             <div key={dog.id_of_dog}>
// //               <h2>Name of Dog: {dog.name_of_dog}</h2>
// //               <p>Reference number: {dog.id}</p>
// //               <p>Owner: {dog.id_of_owner}</p>
// //               <p>owner_id: {dog.owner_id}</p>
// //               <p>Age: {dog.age_of_dog}</p>
// //               <p>Breed: {dog.breed_of_dog}</p>
// //               <p>Bio: {dog.bio_of_dog}</p>
// //               <p>Location: {dog.location_postCode}</p>
// //               <p>Dates for Dog Sitting: {dog.dates_require_dogSitting}</p>
// //               <button onClick={(e) => handleDelete(e, dog.id)}>
// //                 Delete this Dog
// //               </button>
// //             </div>
// //           </form>
// //         ))}
// //       </div>
// //       <p>Please see the dogs above!</p>
// //     </div>
// //   );
// // };

// // export default DogProfiles;
