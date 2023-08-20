import { useGlobal } from "context/GlobalContext";
import React from "react";
// reactstrap components
import { UncontrolledAlert, Container, Table, TableProps } from "reactstrap";

export default function Activity() {
  const { transactions, account } = useGlobal();
  return (

    <div className="section section-notifications" id="notifications">
      <Container>
        <div className="space" />
        <h3>Activity</h3>
        <UncontrolledAlert className="alert-with-icon" color="primary">
          <span data-notify="icon" className="tim-icons icon-coins" />
          <span>
            <b>Congrats! -</b>
            This is a regular notification made with ".alert-primary"
          </span>
        </UncontrolledAlert>
        <UncontrolledAlert className="alert-with-icon" color="info">
          <span data-notify="icon" className="tim-icons icon-trophy" />
          <span>
            <b>Heads up! -</b>
            This is a regular notification made with ".alert-info"
          </span>
        </UncontrolledAlert>
        <UncontrolledAlert className="alert-with-icon" color="success">
          <span data-notify="icon" className="tim-icons icon-bell-55" />
          <span>
            <b>Well done! -</b>
            This is a regular notification made with ".alert-success"
          </span>
        </UncontrolledAlert>
        <UncontrolledAlert className="alert-with-icon" color="warning">
          <span data-notify="icon" className="tim-icons icon-bulb-63" />
          <span>
            <b>Warning! -</b>
            This is a regular notification made with ".alert-warning"
          </span>
        </UncontrolledAlert>
        <UncontrolledAlert className="alert-with-icon" color="danger">
          <span data-notify="icon" className="tim-icons icon-support-17" />
          <span>
            <b>Oh snap! -</b>
            This is a regular notification made with ".alert-danger"
          </span>
        </UncontrolledAlert>
      </Container>
    </div>
    // <div className="section section-notifications" id="notifications">
    //   <Container>
    //     <div className="space" />
    //     <h3>Activity</h3>
    //     <Table borderless>
    //       <thead>
    //         <th>From</th>
    //         <th>To</th>
    //         <th>Amount</th>
    //       </thead>
    //       <tbody>
    //         {transactions?.map((t, index) => (
    //           <tr>
    //             <td>{t.from}</td>
    //             <td>{t.to}</td>
    //             <td>{t.amount}</td>
    //           </tr>
    //         ))}
    //       </tbody>
    //     </Table>
    //   </Container>
    // </div>
  );
}