
import QrReader  from 'react-qr-reader';
import { sha256 } from "js-sha256";


function Qrcheck({setCode,setHash,reader,bloodToBeSearched}) {
//   const [code,setCode] = useState("")
    // const reader = useRef(null);

    const handleScan = (data) => {
        console.log("hhi");
        console.log(typeof data);
        
        if(data) setCode(data);
        // reader.current.reader.result
        var h = bloodToBeSearched.adharNo
          .replaceAll(" ", "")
          .concat(bloodToBeSearched.bloodId)
          .concat(bloodToBeSearched.batchNo);
        setHash(sha256(h));
    };
    const handleError = (err) => {
        console.error(err);
      };
    

   
    return (

        <>
         
            
                                          <QrReader
                                ref={reader}
                                className="m-1"
                               
                                style={{ width: "40%" }}
               
               
                      onScan = {  handleScan}
                     
                  
                       onError ={handleError}
                  
                  
                                legacyMode
            />
       
        </>
    )
}
export default Qrcheck;