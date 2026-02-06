import { useBackend } from '../backend';
import { Window } from '../layouts';


const bgMod = require('../assets/scholar/bg.png');
const bg = bgMod?.default ?? bgMod;

export const Scholar = () => {
  const { act } = useBackend();

  return (
    <>
      <style>
        {`
          .scholar-bg {
            background: transparent !important;
            background-image: url(${bg}) !important;
            background-size: cover !important;
            background-position: center !important;
            background-repeat: no-repeat !important;
          }
        `}
      </style>

      <Window title="Scholar" width={1100} height={700}>
        <Window.Content className="scholar-bg">
          <div style={{ color: 'white', fontSize: 20, fontWeight: 700 }}>
            Scholar UI
          </div>

          <div
            style={{
              display: 'inline-block',
              marginTop: 16,
              padding: '10px 14px',
              border: '2px solid white',
              cursor: 'pointer',
              userSelect: 'none',
              background: 'rgba(0,0,0,0.4)',
            }}
            onClick={() => act('close')}
          >
            Close
          </div>
        </Window.Content>
      </Window>
    </>
  );
};
