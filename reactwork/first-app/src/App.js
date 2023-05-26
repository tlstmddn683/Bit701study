import { useState } from 'react';
import './App.css';
import FifthCmp from './FifthCmp';
import {FirstCmp} from './FirstCmp';
import FourthCmp from './FourthCmp';
import SecondCmp from './SecondCmp';
import ThirdCmp from './ThirdCmp';
import Box from '@mui/material/Box';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import Select, { SelectChangeEvent } from '@mui/material/Select';

const pages = [
  { id: 1, component: <FirstCmp /> },
  { id: 2, component: <SecondCmp /> },
  { id: 3, component: <ThirdCmp /> },
  { id: 4, component: <FourthCmp /> },
  { id: 5, component: <FifthCmp /> },
];

function App() {
  const [selectedPage, setSelectedPage] = useState(1);

  const handleChange = (event: SelectChangeEvent) => {
    setSelectedPage(event.target.value);
  };

  return (
    <div className="App">
      <Box sx={{ marginBottom: '20px' }}>
        <FormControl>
          <InputLabel id="select-label">페이지 선택</InputLabel>
          <Select
            labelId="select-label"
            value={selectedPage}
            onChange={handleChange}
          >
            {pages.map((page) => (
              <MenuItem key={page.id} value={page.id}>
                페이지 {page.id}
              </MenuItem>
            ))}
          </Select>
        </FormControl>
      </Box>

      {pages.map((page) => {
        if (page.id === selectedPage) {
          return <div key={page.id}>{page.component}</div>;
        }
        return null;
      })}
    </div>
  );
}

export default App;
