import React, { useState ,useEffect } from "react";
import GlobalContext from "./GlobalContext";

const GlobalState = (props) => {
  const [user, setUser] = useState({});

  const SET_USER = (user) => {
    setUser(user);
  };
  useEffect(() => {
    // Check localStorage or any other persistent storage
    const savedUser = JSON.parse(localStorage.getItem('user'));
    if (savedUser) {
      setUser(savedUser);
    }
  }, []);

  return (
    <GlobalContext.Provider value={{ user, SET_USER }}>
      {props.children}
    </GlobalContext.Provider>
  );
};

export default GlobalState;

