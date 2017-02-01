LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY Main_Control_Unit IS
   PORT( 
      Instruction_31_26 : IN     std_logic_vector (5 DOWNTO 0);
      Instruction_5_0   : IN     std_logic_vector (5 DOWNTO 0);
      ALUOp             : OUT    std_logic_vector (1 DOWNTO 0);
      ALUSrc            : OUT    std_logic;
      Beq            : OUT    std_logic;
      J              : OUT    std_logic;
      MemRead           : OUT    std_logic;
      MemToReg          : OUT    std_logic;
      MemWrite          : OUT    std_logic;
      RegDst            : OUT    std_logic;
      RegWrite          : OUT    std_logic;
      Bne               : OUT    std_logic;
      Jal               : OUT    std_logic;
      Jr                : OUT    std_logic
   );
END Main_Control_Unit ;


ARCHITECTURE struct OF Main_Control_Unit IS

BEGIN
   -- Insert your code here --
CU :process(Instruction_31_26,Instruction_5_0)
           begin    
            ALUOp <= "00";
            ALUSrc <= '0';
            Beq <= '0';
            Bne <= '0';
            J <= '0';
            Jal <= '0';
            Jr <= '0';
            MemRead <= '0';
            MemToReg <= '0';
            MemWrite <= '0';
            RegDst <= '0';
            RegWrite <= '0';
           case Instruction_31_26 is
           
                ------R type-----
                when "000000" => 
                    if Instruction_5_0 = "001000" then
                    Jr <= '1';
                    else                    
                    ALUOp <= "10";
                    RegDst <= '1';
                    RegWrite <= '1';                   
                    end if;
                    
                 ------load word-----
                 when "100011" =>
                    ALUSrc <= '1';
                    MemRead <= '1';
                    MemToReg <= '1';
                    RegWrite <= '1';
                    
                    ------save word-----
                  when "101011" =>
                    ALUSrc <= '1';
                    MemWrite <= '1';
                    
                   ------beq-----
                  when "000100" =>
                    ALUOp <= "01";
                    Beq <= '1';
                    
                    ------bne-----
                  when "000101" =>
                    ALUOp <= "01";
                    Bne <= '1';
                    
                   ------j-----
                 when "000010" =>
                    J <= '1';
                    
                     ------jal-----
                  when "000011" =>
                    Jal <= '1';
                    RegWrite <= '1';              
                    
                    ------addi-----
                 when "001000" =>
                    --ALUOp <= "00";
                    ALUSrc <= '1';
                    RegWrite <= '1';
                    
                  when others =>NULL;
                   
            end case;
            end process CU;
END struct;
