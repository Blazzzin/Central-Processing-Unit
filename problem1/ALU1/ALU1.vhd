library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity ALU1 is

	port (Clock : in std_logic;
			A, B : in unsigned(7 downto 0);
			OP : in unsigned(15 downto 0);
			Neg : out std_logic;
			R1 : out unsigned(3 downto 0);
			R2 : out unsigned(3 downto 0));
end ALU1;

Architecture calculation of ALU1 is
	signal Reg1, Reg2, Result : unsigned(7 DOWNTO 0) := (others => '0');
	
	Begin
	Reg1 <= A;
	Reg2 <= B;
	
	Process(Clock, OP)
	Begin
		if (rising_edge(Clock)) THEN
			case OP is
				WHEN "1000000000000000" => --add
					Result <= (A + B);
					Neg <= '0';
				WHEN "0100000000000000" => --subtract
					if (A < B) THEN
						Result <= (B - A);
						Neg <= '1';
					else
						Result <= (A - B);
						Neg <= '0';
					end if;
				WHEN "0010000000000000" => --notA
					Result <= not(A);
					Neg <= '0';
				WHEN "0001000000000000" => --not(A and B)
					Result <= (not(A and B));
					Neg <= '0';
				WHEN "0000100000000000" => --not(A or B)
					Result <= (not(A or B));
					Neg <= '0';
				WHEN "0000010000000000" => --(A and B)
					Result <= (A and B);
					Neg <= '0';
				WHEN "0000001000000000" => --(A xor B)
					Result <= (A xor B);
					Neg <= '0';
				WHEN "0000000100000000" => --(A or B)
					Result <= (A or B);
					Neg <= '0';
				WHEN "0000000010000000" => --not(A xor B)
					Result <= (not(A xor B));
					Neg <= '0';
				WHEN OTHERS =>
					Result <= "00000000";
			end case;
		end if;
	end process;
	
	R1 <= Result(3 downto 0);
	R2 <= Result(7 downto 4);
	
end calculation;