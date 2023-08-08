import React, { useEffect, useState } from "react";
import { Routes, Route } from "react-router-dom";
import SignUp from "./SignUp";
import Login from "./Login";
import NavBar from "./NavBar";
import DogProfiles from "./DogProfiles";

function Home({ user }) {
  console.log("the user inside the HOME COMP is:", user);

  if (user) {
    return (
      <>
        <h1>Welcome, {user.username}!</h1>
      </>
    );
  } else {
    return <h1>Pleas Login or Sign Up</h1>;
  }
}

export default Home;
