import * as emailjs from "emailjs-com";

function SendEmail(data) {
  const SERVICE_ID = "service_veqatbp";
  const TEMPLATE_ID = "template_ap4lf7j";
  const USER_ID = "vA6csiGByU8SX2xIl";
  emailjs.send(SERVICE_ID, TEMPLATE_ID, data, USER_ID).then(
    function (response) {
      console.log(response.status, response.text);
    },
    function (err) {
      console.log(err);
    }
  );
}

export default SendEmail; 
