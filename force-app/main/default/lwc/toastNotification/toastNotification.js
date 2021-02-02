import { LightningElement } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class ToastNotification extends LightningElement {
  _title = "Sample Title";
  message = "Sample Message";
  variant = "error";
  variantOptions = [
    { label: "Failure", value: "error" },
    { label: "Alert", value: "warning" },
    { label: "You Did it", value: "success" },
    { label: "Information", value: "info" }
  ];

  titleChange(event) {
    this._title = event.target.value;
  }

  messageChange(event) {
    this.message = event.target.value;
  }

  variantChange(event) {
    this.variant = event.target.value;
  }

  showNotification() {
    const evt = new ShowToastEvent({
      title: this._title,
      message: this.message,
      variant: this.variant
    });
    this.dispatchEvent(evt);
  }
}
