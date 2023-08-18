import React from "react";
// core components
import IndexNavbar from "components/Navbars/IndexNavbar.js";
import PageHeader from "components/PageHeader/PageHeader.js";
import Footer from "components/Footer/Footer.js";

// sections for this page/view
import Basics from "pages/IndexSections/Basics.js";
import Navbars from "pages/IndexSections/Navbars.js";
import Tabs from "pages/IndexSections/Tabs.js";
import Pagination from "pages/IndexSections/Pagination.js";
import Notifications from "pages/IndexSections/Notifications.js";
import Typography from "pages/IndexSections/Typography.js";
import JavaScript from "pages/IndexSections/JavaScript.js";
import NucleoIcons from "pages/IndexSections/NucleoIcons.js";
import Signup from "pages/IndexSections/Signup.js";
import Examples from "pages/IndexSections/Examples.js";
import Download from "pages/IndexSections/Download.js";

export default function Home() {
  React.useEffect(() => {
    document.body.classList.toggle("index-page");
    // Specify how to clean up after this effect:
    return function cleanup() {
      document.body.classList.toggle("index-page");
    };
  }, []);
  return (
    <>
      <IndexNavbar />
      <div className="wrapper">
        <PageHeader />
        <div className="main">
          <Basics />
          <Navbars />
          <Tabs />
          <Pagination />
          <Notifications />
          <Typography />
          <JavaScript />
          <NucleoIcons />
          <Signup />
          <Examples />
          <Download />
        </div>
        <Footer />
      </div>
    </>
  );
}
