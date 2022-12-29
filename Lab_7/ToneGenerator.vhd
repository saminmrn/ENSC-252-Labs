Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity ToneGenerator is
	port (clear, clock : in std_logic;
			Freq: in unsigned(15 downto 0); 
			WaveOut: out signed (15 downto 0)); 

End ToneGenerator;

Architecture behaviour of ToneGenerator is

signal Q, D: signed (21 downto 0); 

begin 

process (clock)
begin 
if rising_edge(clock) then

	if clear='1' then
	Q <= D+Q;
	else
	Q <= (others => '0');
	end if;
end if;

end process;

WaveOut <= Q(21 downto 6);
D <="000000"& signed(Freq);


End behaviour; 