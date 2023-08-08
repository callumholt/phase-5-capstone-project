import React, { useEffect, useState } from "react";
import { Routes, Route } from "react-router-dom";
import SignUp from "./SignUp";
import Login from "./Login";
import NavBar from "./NavBar";
import Home from "./Home";
import DogProfiles from "./DogProfiles";
import Newdog from "./NewDog";
import Updatedog from "./UpdateDog";

function App() {
  const [user, setUser] = useState(null);
  console.log("the user when inside the app func: ", user);

  useEffect(() => {
    // auto-login
    fetch("/me").then((r) => {
      if (r.ok) {
        r.json().then((user) => setUser(user));
        console.log("the user is: ", user);
      }
    });
  }, []);

  console.log("the user when outside the app func is: ", user);

  return (
    <>
      <NavBar user={user} setUser={setUser} />
      <main>
        <Routes>
          {user ? (
            <>
              <Route path="/" element={<Home user={user} />} />
              <Route path="/dogs" element={<DogProfiles />} />
              <Route path="/newdog" element={<Newdog />} />
              <Route path="/updatedog" element={<Updatedog />} />
            </>
          ) : (
            <>
              <Route path="/signup" element={<SignUp setUser={setUser} />} />
              <Route path="/login" element={<Login setUser={setUser} />} />
              <Route path="/" element={<Home />} />
            </>
          )}
        </Routes>
      </main>
    </>
  );
}

export default App;
