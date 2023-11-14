import React from "react";
import "./StatsPage.css";
import { getUsers } from "../config/utils";
import { useState, useEffect } from "react";

function StatsPage() {
  const [leaderBoard, setLeaderBoard] = useState([]);
  const [dormStats, setDormStats] = useState({});
  const [stableStats, setStableStats] = useState({});

  useEffect(() => {
    async function fetchData() {
      const { sortedUsers, stableTags, dormTags } = await getUsers();

      setLeaderBoard(sortedUsers);
      setDormStats(dormTags);
      setStableStats(stableTags);
    }

    fetchData();
  }, []);
  function toTitleCase(str) {
    return str.replace(/\w\S*/g, function (txt) {
      return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
    });
  }

  return (
    <div className="StatsPage Page">
      <div className="columns">
        <div className="column-1">
          <h1>Leaderboard</h1>
          <ul className="leaderboard">
            {leaderBoard.slice(0, 20).map((entry, idx) => {
              return (
                <li className="leaderboard-person" key={entry.chaser}>
                  <div className="place-and-title">
                    <p className="place">{idx + 1}</p>
                    <div className="">
                      <h3
                        style={{
                          color: entry.alive ? {
                            blue: "#4e79d1",
                            green: "#59a14f",
                            orange: "#e69f00",
                            pink: "#ff9da7",
                            purple: "#6e34eb",
                            red: "#eb3449",
                          }[entry.stable] : "var(--secondary-color",
                        }}
                      >
                        {entry.firstName} {entry.lastName}
                        {entry.alive ? "" : " 💀"}
                      </h3>
                      <p>
                        {toTitleCase(entry.class)} - {toTitleCase(entry.dorm)} -{" "}
                        {toTitleCase(entry.stable)} Stable{" "}
                      </p>
                    </div>
                  </div>
                  <h2 className="num-tags" >{entry.tags}</h2>
                </li>
              );
            })}
          </ul>
        </div>

        <div className="column-2">
          <div className="row-1">
            <h1>Dorms</h1>

            <div className="dorms">
              {Object.entries(dormStats)
                .filter(([dorm]) => dorm !== "day")
                .map(([dorm, { totalTags, topTagger }]) => (
                  <div key={dorm} className="dorm">
                    <h3>{toTitleCase(dorm)}</h3>
                    <p>Total Dorm Tags: {totalTags}</p>

                    {topTagger && (
                      <p className="lead-tagger-p">
                        <span className="top-tagger">{topTagger.name}</span> is
                        leading with {topTagger.tags} tag(s)
                      </p>
                    )}
                  </div>
                ))}
            </div>
          </div>

          <div className="row-2">
            <h1>Stables</h1>
            <div className="stables">
              {Object.entries(stableStats).map(([stable, tags]) => (
                <div key={stable} className="dorm">
                  <h3
                    style={{
                      color: {
                        blue: "#4e79d1",
                        green: "#59a14f",
                        orange: "#e69f00",
                        pink: "#ff9da7",
                        purple: "#6e34eb",
                        red: "#eb3449",
                      }[stable],
                    }}
                  >
                    {toTitleCase(stable)}
                  </h3>
                  <p>Total Stable Tags: {tags}</p>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
      <div className="Stats-Card"></div>
    </div>
  );
}

export default StatsPage;
