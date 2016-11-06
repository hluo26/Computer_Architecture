LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Main_Control_Unit IS
   PORT( 
      Instruction_31_26 : IN     std_logic_vector (5 DOWNTO 0);
      ALUOp             : OUT    std_logic_vector (1 DOWNTO 0);
      ALUSrc            : OUT    std_logic;
      Branch            : OUT    std_logic;
      Jump              : OUT    std_logic;
      MemRead           : OUT    std_logic;
      MemToReg          : OUT    std_logic;
      MemWrite          : OUT    std_logic;
      RegDst            : OUT    std_logic;
      RegWrite          : OUT    std_logic
   );
END Main_Control_Unit ;


ARCHITECTURE behav OF Main_Control_Unit IS

BEGIN
    
   -- insert your design here --
    CU :process(Instruction_31_26)
           begin
           case Instruction_31_26 is
           
                ------R type-----
                when "000000" =>
                    ALUOP <= "10";
                    ALUSrc <= '0';
                    Branch <= '0';
                    Jump <= '0';
                    MemRead <= '0';
                    MemToReg <= '0';
                    MemWrite <= '0';
                    RegDst <= '1';
                    RegWrite <= '1';
                    
                 ------load word-----
                 when "100011" =>
                    ALUOP <= "00";
                    ALUSrc <= '1';
                    Branch <= '0';
                    Jump <= '0';
                    MemRead <= '1';
                    MemToReg <= '1';
                    MemWrite <= '0';
                    RegDst <= '0';
                    RegWrite <= '1';
                    
                    ------save word-----
                  when "101011" =>
                    ALUOP <= "00";
                    ALUSrc <= '1';
                    Branch <= '0';
                    Jump <= '0';
                    MemRead <= '0';
                    MemToReg <= '0';
                    MemWrite <= '1';
                    RegDst <= '0';
                    RegWrite <= '0';
                    
                   ------beq-----
                  when "000100" =>
                    ALUOP <= "01";
                    ALUSrc <= '0';
                    Branch <= '1';
                    Jump <= '0';
                    MemRead <= '0';
                    MemToReg <= '0';
                    MemWrite <= '0';
                    RegDst <= '0';
                    RegWrite <= '0';
                    
                   ------jump-----
                 when "000010" =>
                    ALUOP <= "00";
                    ALUSrc <= '0';
                    Branch <= '0';
                    Jump <= '1';
                    MemRead <= '0';
                    MemToReg <= '0';
                    MemWrite <= '0';
                    RegDst <= '0';
                    RegWrite <= '0';
                    
                    ------addi-----
                 when "001000" =>
                    ALUOP <= "00";
                    ALUSrc <= '1';
                    Branch <= '0';
                    Jump <= '0';
                    MemRead <= '0';
                    MemToReg <= '0';
                    MemWrite <= '0';
                    RegDst <= '0';
                    RegWrite <= '1';
                    
                  when others =>
                    ALUSrc <= '0';
                    Branch <= '0';
                    Jump <= '0';
                    MemRead <= '0';
                    MemToReg <= '0';
                    MemWrite <= '0';
                    RegDst <= '0';
                    RegWrite <= '0';
                    
                    
                
            end case;
            end process CU;
   -----------------------------
   
END behav;
