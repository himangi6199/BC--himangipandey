pragma solidity ^0.5.0;

contract voting{
    
    uint counter;
    
    
    struct citizen{
        address User_ID;
        string Name;
        uint pin;
        bool log;
        bool verified;
        bool account_status;
    }
    
    
    struct candidate{
        address User_ID;
        string Name;
        string Campaign_name;
        uint pin;
        bool log;
        bool verified;
        bool account_status;
    }
    
    
    string public citizen_name;
    
     address[] account_citizen;
      address[] account_candidate;
       bool isActive;

    
     mapping(address=>citizen) Citizen; 
      mapping(address=>candidate) Candidate; 
     
     event Login(string msg);
     
     event votingStarted(address _voting, string _citizen_name);
     
     event candidateRegistered(address);
     
     event auctionStatus(string status, address _voting);
     
     enum CandidateState{Registered}
    
    CandidateState state;
    
    
    
      
    
  
    
    function citizenRegister(string memory _Name, uint _pin)public{
        require(Citizen[msg.sender].User_ID != msg.sender,"User Already Registered");
        Citizen[msg.sender].User_ID=msg.sender;
        Citizen[msg.sender].Name=_Name;
        Citizen[msg.sender].pin=_pin;
        Citizen[msg.sender].account_status=true;
        emit Login("User Registered Successfully");
        account_citizen.push(msg.sender);
        counter++;
        
    }
    
    
     function candidateRegister(string memory _Name, uint _pin)public{
        require(Candidate[msg.sender].User_ID != msg.sender,"User Already Registered");
        Candidate[msg.sender].User_ID=msg.sender;
        Candidate[msg.sender].Name=_Name;
        Candidate[msg.sender].pin=_pin;
        Candidate[msg.sender].account_status=true;
        
        emit Login("User Registered Successfully");
        account_candidate.push(msg.sender);
        counter++;
        
    }
    
    function startVote() public{
         
         state = CandidateState.Registered;
        isActive=true;
        
        emit votingStarted(address(this),citizen_name);
    }
    
    function registerCampaign(string memory _Campaign_name) public{
        
         state = CandidateState.Registered;
         Candidate[msg.sender].Campaign_name=_Campaign_name;
    }
    
   
    

}