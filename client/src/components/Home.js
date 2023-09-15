import React, { useState } from "react";
import { Configuration, OpenAIApi } from "openai";
import OpenAI from "openai";

function Home({ user }) {
  const [formData, setFormData] = useState({
    name: "",
    userId: "",
    goal: "",
    experience: "beginner",
    sessionsPerWeek: "",
    sessionDuration: "",
    injuries: "",
  });
  const [respFromOpenA, setRespFromOpenAi] = useState({});

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    const openAiCall = "/openai";

    try {
      console.log("the formdata is:", formData);
      const response = await fetch(openAiCall, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(formData),
      });

      console.log("fetch sent");
      console.log("the formdata after being sent is:", formData);

      if (!response.ok) {
        throw new Error(
          `Network response was not ok. Status: ${response.status}`
        );
      }

      const responseData = await response.json();
      console.log("API Response:", responseData);
      setRespFromOpenAi(responseData);
    } catch (error) {
      console.error("Error:", error.message);
      console.error("Stack Trace:", error.stack);
    }
  };

  if (user) {
    return (
      <>
        <h1>Welcome, {user.name}, it is wonderful to have you here!</h1>
        <h2>
          In order to generate a workout, you will need your user id, which is,{" "}
          {user.id}!
        </h2>

        <form onSubmit={handleSubmit}>
          <div>
            <label>
              Name:
              <input
                type="text"
                name="name"
                value={formData.name}
                onChange={handleInputChange}
              />
            </label>
          </div>
          <div>
            <label>
              User ID:
              <input
                type="number"
                name="userId"
                value={formData.userId}
                onChange={handleInputChange}
              />
            </label>
          </div>
          <div>
            <label>
              Fitness Goal:
              <input
                type="text"
                name="goal"
                value={formData.goal}
                onChange={handleInputChange}
              />
            </label>
          </div>
          <div>
            <label>
              Fitness Experience:
              <select
                name="experience"
                value={formData.experience}
                onChange={handleInputChange}
              >
                <option value="beginner">Beginner</option>
                <option value="intermediate">Intermediate</option>
                <option value="advanced">Advanced</option>
              </select>
            </label>
          </div>
          <div>
            <label>
              Sessions per Week:
              <input
                type="number"
                name="sessionsPerWeek"
                value={formData.sessionsPerWeek}
                onChange={handleInputChange}
              />
            </label>
          </div>
          <div>
            <label>
              Session Duration (minutes):
              <input
                type="number"
                name="sessionDuration"
                value={formData.sessionDuration}
                onChange={handleInputChange}
              />
            </label>
          </div>
          <div>
            <label>
              Injuries:
              <input
                type="text"
                name="injuries"
                value={formData.injuries}
                onChange={handleInputChange}
              />
            </label>
          </div>
          <button type="submit">Submit</button>
        </form>
      </>
    );
  } else {
    // This is when someone arrives before log on.
    return (
      <div
        style={{
          textAlign: "center",
          fontFamily: "Arial, sans-serif",
        }}
      >
        <h1 style={{ fontSize: "2em", marginBottom: "0.5em" }}>Hello!</h1>
        <h2
          style={{
            fontSize: "1.5em",
            fontWeight: "normal",
            marginBottom: "1em",
          }}
        >
          Welcome to StrongBot, this app is designed to help you build a workout
          plan based on a range of personal factors.
        </h2>
        <p
          style={{
            fontSize: "1em",
            maxWidth: "500px",
            margin: "0 auto",
            marginBottom: "2em",
          }}
        >
          If you already have an account, Please Login or alternatively click on
          Sign Up to create an account.
        </p>
      </div>
    );
  }
}

export default Home;
