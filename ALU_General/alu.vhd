library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity ALU is

	port (Clock : in std_logic;
			A, B : in unsigned(7 downto 0);
			student_id : in unsigned(3 downto 0);
			OP : in unsigned(15 downto 0);
			Neg : out std_logic;
			R1 : out unsigned(3 downto 0);
			R2 : out unsigned(3 downto 0));
end ALU;

Architecture calculation of ALU is
	signal Reg1, Reg2, Result: unsigned(7 downto 0) := (others => '0');
	signal Reg4 : unsigned (0 to 7);
	
	Begin
		Reg1 <= A;
		Reg2 <= B;
		
	Process(Clock, OP)
	Begin
		if (rising_edge(Clock)) THEN
			case OP is
				WHEN "0000000000000001" =>
					--do whatever
				WHEN "0000000000000100" =>
					--do whatever
				WHEN "0000000000001000" =>
					--do whatever
				WHEN "0000000000010000" =>
					--do whatever
				WHEN "0000000000100000" =>
					--do whatever
				WHEN "0000000001000000" =>
					--do whatever
				WHEN "0000000010000000" =>
					--do whatever
				WHEN "0000000100000000" =>
					--do whatever
				WHEN OTHERS =>
					--dont care do nothing
			end case;
		end if;
	end process;
	
	R1 <= Result(3 downto 0);
	R2 <= Result(7 downto 4);
end calculation;
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				