# Blockchain-Enabled Blood Bank Management System  

A decentralized and transparent system to manage blood donation, verification, and distribution using blockchain technology. This system ensures accountability, data security, and efficient resource allocation across donors, blood banks, and hospitals.  

## Features  

- **Donor Management**  
  - Blood donation at campsites or blood banks.  
  - Blockchain-secured storage of donor data including Aadhaar numbers, blood group, and blood IDs.  
  - Donor notifications about blood acceptance or rejection.  
  - Donor tracking of blood history via Aadhaar number and blood ID.  

- **Blood Verification**  
  - Unverified blood marked as "Tested and Safe" or "Tested and Unsafe" after inspection.  
  - QR code generation for verified blood, combining Aadhaar numbers, blood ID, and batch hash.  
  - QR code download for physical attachment to blood packets.  

- **Hospital Management**  
  - Blood request by specifying patient's Aadhaar and required blood group.  
  - Optimal blood bank selection using distance and availability factors.  
  - Tracking blood location on Google Maps.  
  - QR code verification for blood received.  

- **Security and Accountability**  
  - Aadhaar-based 2FA for donor and patient verification.  
  - Metamask wallet integration for transaction verification.  
  - Hospital login with admin-provided credentials.  

## System Workflow  

1. **Donation**: Blood is donated and details are recorded in the blockchain as an unverified block.  
2. **Verification**: Blood is inspected, labeled, and a QR code is generated for safe blood.  
3. **Distribution**: An efficiency algorithm identifies the Optimal blood bank for hospital requests.  
4. **Tracking and Logging**: Donors can track their blood, and hospitals ensure accountability via blockchain logs.  

## Technology Stack  

- **Frontend**: HTML, CSS, JavaScript, React  
- **Backend**: Node.js, Express.js  
- **Blockchain**: Ethereum (GANACHE) 
- **Other Tools**: Aadhaar API, QR code generation libraries, Google Maps API  

## Installation  

1. Clone the repository:  
   ```bash  
   git clone https://github.com/amratanshu788/Bloodbank_Blockchain.git
