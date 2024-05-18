{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "superp0sition";
    userEmail = "badsuperp0sition@gmail.com";
    
    extraConfig = { 
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
