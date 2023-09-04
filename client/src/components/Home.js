import React, { useEffect, useState } from "react";
import { Routes, Route } from "react-router-dom";
import SignUp from "./SignUp";
import Login from "./Login";
import NavBar from "./NavBar";
import WorkoutProfiles from "./WorkoutProfiles";

function Home({ user }) {
  console.log("the user inside the HOME COMP is:", user);

  if (user) {
    return (
      <>
        <h1>Welcome, {user.name}!</h1>
        <h1>Your user id is, {user.id}!</h1>
      </>
    );
  } else {
    return <h1>Pleas Login or Sign Up</h1>;
  }
}

export default Home;
