import React, { useState } from "react";
import { redirect } from "react-router-dom";

function Updatedog() {
  const [id, setId] = useState("");
  const [nameofdog, setNameofdog] = useState("");
  const [ageofdog, setAgeofdog] = useState("");
  const [breedofdog, setBreedofdog] = useState("");
  const [bioofdog, setBioofdog] = useState("");
  const [locationpostCode, setLocationpostCode] = useState("");
  const [datesrequiredogSitting, setDatesrequiredogSitting] = useState("");

  function handleSubmit(e) {
    e.preventDefault();
    console.log("the id is:", id);
    fetch(`/dogs/${id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        id: id,
        name_of_dog: nameofdog,
        age_of_dog: ageofdog,
        breed_of_dog: breedofdog,
        bio_of_dog: bioofdog,
        location_postCode: locationpostCode,
        dates_require_dogSitting: datesrequiredogSitting,
      }),
    }).then((r) => {
      if (r.ok) {
        console.log("the dog was successfully updated");
        alert("Dog Successfully Updated");
      } else {
        throw new Error("failed to update dog");
      }
    });
  }

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <h1>
          Please enter the information below to update your dog, please note,
          only enter in the fields you wish to enter, reference number is
          compulsory
        </h1>

        <label htmlFor="nameofdog">Name of Dog</label>
        <input
          type="text"
          id="nameofdog"
          autoComplete="off"
          value={nameofdog}
          onChange={(e) => setNameofdog(e.target.value)}
        />

        <label htmlFor="id">Reference number of Dog</label>
        <input
          type="integer"
          id="Referencenumber"
          autoComplete="off"
          value={id}
          onChange={(e) => setId(e.target.value)}
          required
        />

        <label htmlFor="ageofdog">Age_of_dog</label>
        <input
          type="integer"
          id="ageofdog"
          value={ageofdog}
          onChange={(e) => setAgeofdog(e.target.value)}
        />
        <label htmlFor="breedofdog">breed_of_dog</label>
        <input
          type="text"
          id="breedofdog"
          value={breedofdog}
          onChange={(e) => setBreedofdog(e.target.value)}
        />
        <label htmlFor="bioofdog">bio_of_dog</label>
        <input
          type="text"
          id="bioofdog"
          value={bioofdog}
          onChange={(e) => setBioofdog(e.target.value)}
        />

        <label htmlFor="locationpostCode">Postcode Location of Dog</label>
        <input
          type="integer"
          id="locationpostCode"
          value={locationpostCode}
          onChange={(e) => setLocationpostCode(e.target.value)}
        />
        <label htmlFor="datesrequiredogSitting">
          What dates do you require dogsitting (string)?
        </label>
        <input
          type="text"
          id="datesrequiredogSitting"
          value={datesrequiredogSitting}
          onChange={(e) => setDatesrequiredogSitting(e.target.value)}
        />
        <button type="submit">Click here to update</button>
      </form>
    </div>
  );
}

export default Updatedog;
