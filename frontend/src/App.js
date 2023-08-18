import React from "react";
import { Route, Routes, Navigate } from "react-router-dom";
import "assets/css/nucleo-icons.css";
import "assets/scss/blk-design-system-react.scss";
import "assets/demo/demo.css";

import Index from "views/Index.js";
import LandingPage from "views/examples/LandingPage.js";
import RegisterPage from "views/examples/RegisterPage.js";
import ProfilePage from "views/examples/ProfilePage.js";

const App = ()=>{
    return (
        <Routes>
        <Route path="/components" element={<Index />} />
        <Route path="/landing-page" element={<LandingPage />} />
        <Route path="/register-page" element={<RegisterPage />} />
        <Route path="/profile-page" element={<ProfilePage />} />
        <Route path="*" element={<Navigate to="/components" replace />} />
      </Routes>
    )
}
export default App;
