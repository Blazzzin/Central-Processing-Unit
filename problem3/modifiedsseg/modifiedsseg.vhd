LIBRARY ieee;
USE ieee.std_logic_1164.all;

	ENTITY modifiedsseg IS
	PORT ( bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			 leds1 : OUT STD_LOGIC_VECTOR(0 to 6));
			 
	end modifiedsseg;
	
	ARCHITECTURE Behavior OF modifiedsseg IS
	BEGIN
		PROCESS (bcd)
		BEGIN
			CASE bcd IS   			 -- 0123456789abcdefg
				WHEN "0000" =>leds1<= "1000100"; -- y
				WHEN "1111" =>leds1<= "0001001"; -- n
				WHEN OTHERS =>leds1<= "-------"; 
			END CASE;
		END PROCESS;
	END Behavior;