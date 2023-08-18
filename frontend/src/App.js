import React from "react";
import { Route, Routes, Navigate } from "react-router-dom";
import "assets/css/nucleo-icons.css";
import "assets/scss/blk-design-system-react.scss";
import "assets/demo/demo.css";

import Home from "pages/examples/LandingPage.js";
import ProfilePage from "pages/examples/ProfilePage.js";
import RegisterPage from "pages/examples/RegisterPage.js";

const App = ()=>{
    return (
        <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/profile-page" element={<ProfilePage />} />
        <Route path="/register-page" element={<RegisterPage />} />
        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>
    )
}
export default App;
