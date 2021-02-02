import { LightningElement } from "lwc";

export default class ConditionalRendering extends LightningElement {
  areDetailsVisible = false;

  handleChange(event) {
    this.areDetailsVisible = event.target.checked;
  }
  contacts = [
    {
      Id: 1,
      Name: "Anya Taylor Joy",
      Movie: "Split"
    },
    {
      Id: 2,
      Name: "Michael Jai White",
      Movie: "Blood and Bone"
    },
    {
      Id: 3,
      Name: "Jennifer Lawrance",
      Movie: "Hunger Games"
    }
  ];
}
