LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;

entity AlarmSystem is 
	port (KEY: in std_logic_vector(0 downto 0);
			SW: in std_logic_vector(17 downto 0);
			CLOCK_50: in std_logic;
			HEX7,HEX6, HEX5, HEX4,HEX0, HEX1, HEX2: out std_logic_vector(6 downto 0);
			LEDG : out  std_logic_vector(7 downto 0);
			LEDR : out  std_logic_vector(17 downto 0)); 
end AlarmSystem;

Architecture behaviour of AlarmSystem is

signal sigdisarm : std_logic;
signal trigger: std_logic:= '0';


component BlinkSystem is 
	port (clock, enable: in std_logic;
			Seg0, Seg1, Seg2, Seg3: out std_logic_vector(6 downto 0);
			green: out std_logic_vector(7 downto 0);
			red : out std_logic_vector(17 downto 0)); 
end component; 

component DisarmSystem is 

	port (clock: in std_logic;
			w  : in std_logic_vector (1 downto 0);
			disarm : out std_logic;
			Seg0, Seg1, Seg2: out std_logic_vector(6 downto 0)); 
end component; 

begin		

	obj1: DisarmSystem
	port map(Seg0 => HEX2,
				Seg1=>HEX1 ,
				Seg2 =>HEX0,
				disarm=>sigdisarm,
				clock=>KEY(0),
				w=>Sw(2 downto 1));
				
	obj2: BlinkSystem
	port map(enable => trigger, 
			Seg0 => HEX7,
			Seg1=>HEX6 ,
			Seg2 =>HEX5,
			Seg3=>HEX4,
			green=>LEDG,
			red =>LEDR,
			clock=>CLOCK_50);
	
	
	--trigger<= SW(0);
	
	process(CLOCK_50, trigger,sigdisarm, SW) 
	begin
	if rising_edge(CLOCK_50) then
	 if (sigdisarm='1') then
		trigger <='0';
		
		elsif((SW(0)='1') and ((sw(17) ='1')or(sw(16) ='1')or(sw(15) ='1')) )then
		
			trigger<='1'; 
		else 
			trigger<=trigger; 
		end if;
	else		
		trigger<= trigger;
	end if;
	end process;
		
	
end behaviour;
			
			