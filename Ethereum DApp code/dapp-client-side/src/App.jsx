import { useState } from 'react'
import { Contract,  BrowserProvider } from "ethers";
import { contractAddress } from "./deployed_addresses.json";
import { abi } from "./Cert.json";
import "./App.css"

function App() {

  const [output, setOutput] = useState()
  const [queryID, setQueryID] = useState(0)

  const [formData, setFormData] = useState({
    id: 0,
    name: '',
    course: '',
    grade: '',
    date: '',
  });

  const provider = new BrowserProvider(window.ethereum)

  async function connectMetaMask() {
    const signer = await provider.getSigner()

    alert(`Successfully Connected ${signer.address}`)
  }

  const handleChange = (event) => {
    const { name, value } = event.target;
    setFormData((prevState) => ({ ...prevState, [name]: value }));
  };

  const handleSubmit = async (event) => {
    event.preventDefault();

    console.log(formData);

    const signer = await provider.getSigner()
    const instance = new Contract(contractAddress, abi, signer)

    const trx = await instance.issue(formData.id, formData.name, formData.course, formData.grade, formData.date)
    console.log('Transaction Hash:', trx.hash)

    resetForm();
  };

  const resetForm = () => {
    setFormData({ id: 0, name: '', course: '', grade: '', date: '' });
  };

  const getCertificate = async () => {
    const signer = await provider.getSigner()
    const instance = new Contract(contractAddress, abi, signer)

    const result = await instance.Certificates(queryID)
    if (result) {
      setOutput(result)
    }
  }

  return (
    <div>
      <button onClick={connectMetaMask}>Connect MetaMask</button>
    <form onSubmit={handleSubmit}>
      <div>
        <label htmlFor="id">ID:</label>
        <input
          type="number"
          id="id"
          name="id"
          value={formData.id}
          onChange={handleChange}
        />
      </div>
      <div>
        <label htmlFor="name">Name:</label>
        <input
          type="text"
          id="name"
          name="name"
          value={formData.name}
          onChange={handleChange}
        />
      </div>
      <div>
        <label htmlFor="course">Course:</label>
        <input
          type="text"
          id="course"
          name="course"
          value={formData.course}
          onChange={handleChange}
        />
      </div>
      <div>
        <label htmlFor="grade">Grade:</label>
        <input
          type="text"
          id="grade"
          name="grade"
          value={formData.grade}
          onChange={handleChange}
        />
      </div>
      <div>
        <label htmlFor="date">Date:</label>
        <input
          type="date"
          id="date"
          name="date"
          value={formData.date}
          onChange={handleChange}
        />
      </div>
      <div>
        <button type="submit">Submit</button>
        <button type="button" onClick={resetForm}>
          Reset
        </button>
      </div>
    </form>
    <br />
    <br />
    <div>
        <label htmlFor="queryID">Query ID:</label>
        <input
          type="number"
          id="queryID"
          name="queryID"
          value={queryID}
          onChange={(e) => setQueryID(e.target.value)}
        />
      </div>
    <button
        onClick={getCertificate}
      >
        Get Certificate
      </button>
      <p>{output}</p>
    </div>
  );
}

export default App