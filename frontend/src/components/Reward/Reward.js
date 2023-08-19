import React from "react";
// reactstrap components
import Card from "./Card"
import {
  Col,
  Row,
  Container,
} from "reactstrap";

export default function Reward() {
    const rewards = [
        {
          name: "Reward 1",
          price: "10 points",
          about: "Description of Reward 1",
        },
        {
            name: "Reward 2",
            price: "10 points",
            about: "Description of Reward 1",
          },
          {
            name: "Reward 3",
            price: "10 points",
            about: "Description of Reward 1",
          }]
    return (
    <Container>
        <div className="space" />
        <h3>Rewards</h3>
      <Row>
        {rewards.map((reward, index) => (
          <Col key={index} xs="12" md="4">
            <Card reward={reward} />
          </Col>
        ))}
      </Row>
    </Container>
      );
}

