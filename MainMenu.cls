 
/*------------------------------------------------------------------------
   File        : MainMenu
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : Akash
   Created     : Mon Jul 08 23:35:21 IST 2024
   Notes       : components
 ----------------------------------------------------------------------*/

using Progress.Lang.*.
using Progress.Windows.Form.
using Progress.Lang.Object.
using System.Windows.Forms.*.

block-level on error undo, throw.

class MainMenu inherits Form: 
    
    define private variable AssistantPictureBox                    as System.Windows.Forms.PictureBox        no-undo.
    define private variable BTNNotification                        as System.Windows.Forms.Button            no-undo.
    define private variable BTNFavorite                            as System.Windows.Forms.Button            no-undo.
    define private variable BTNTODO                                as System.Windows.Forms.Button            no-undo.
    define private variable button1                                as System.Windows.Forms.Button            no-undo.
    define private variable button3                                as System.Windows.Forms.Button            no-undo.
    define private variable components                             as System.ComponentModel.IContainer       no-undo.
    define private variable FavIcon                                as System.Windows.Forms.Panel             no-undo.
    define private variable FavoritePanel                          as System.Windows.Forms.Panel             no-undo.
    define private variable FavSubMenupanel                        as System.Windows.Forms.FlowLayoutPanel   no-undo.
    define private variable imageList                              as System.Windows.Forms.ImageList         no-undo.
    define private variable MenuBar                                as System.Windows.Forms.Panel             no-undo.
    define private variable MenuBarPictureBox                      as System.Windows.Forms.PictureBox        no-undo.
    define private variable menuStrip1                             as System.Windows.Forms.MenuStrip         no-undo.
    define private variable fileToolStripMenuItem                  as System.Windows.Forms.ToolStripMenuItem no-undo.
    define private variable exitToolStripMenuItem                  as System.Windows.Forms.ToolStripMenuItem no-undo.
    
    //Full Screen Mode
    define private variable NotificationPanel                      as System.Windows.Forms.Panel             no-undo.
    define private variable NotSubMenupanel                        as System.Windows.Forms.FlowLayoutPanel   no-undo.
    define private variable OnLoadWidth                            as integer                                no-undo.
    define private variable OnLoadHight                            as integer                                no-undo.
    //End of Full Screen Mode
    
    // Main Menu Data return
    define         variable MainMenuProcHandel                     as handle                                 no-undo. 
    define private variable CreateMainMenuToolStripMenuItem        as System.Windows.Forms.ToolStripMenuItem no-undo.
    define private variable AccountPayableToolStripMenuItem        as System.Windows.Forms.ToolStripMenuItem no-undo.
    define private variable PINPictureBox                          as System.Windows.Forms.PictureBox        no-undo.
    define private variable PurchasingToolStripMenuItem            as System.Windows.Forms.ToolStripMenuItem no-undo.
    define private variable SalesToolStripMenuItem                 as System.Windows.Forms.ToolStripMenuItem no-undo.
    
    // End of Main Menu Data return
    
    //Sub Menu
    define private variable CreateSubMenuMenuToolStripMenuItem     as System.Windows.Forms.ToolStripMenuItem no-undo.
    
    // End Of Sub Menu
    
    // Sub Menu List
    define private variable CreateSubMenuListMenuToolStripMenuItem as System.Windows.Forms.ToolStripMenuItem no-undo.
    
    //End of Sub Menu List


    //Tab Control
    define private variable tabControl1                            as System.Windows.Forms.TabControl        no-undo.
    define private variable tabPage                                as System.Windows.Forms.TabPage           no-undo.
    
    define private variable CloseTab                               as System.Windows.Forms.Button            no-undo.
    define private variable tabPageSelected                        as System.Windows.Forms.TabPage           no-undo.
    define private variable tabPageName                            as character                              no-undo.
    define private variable intab                                  as System.Windows.Forms.TabPage           no-undo.
    
    //End of tab control
    
    // Container 
    define private variable Containerhandle                        as handle                                 no-undo.
    define private variable ContainerWin                           as handle                                 no-undo.
    define private variable TimerMenuBar                           as System.Windows.Forms.Timer             no-undo.
    define private variable TimerReloadNotificaton                 as System.Windows.Forms.Timer             no-undo.
    define private variable TODOPanel                              as System.Windows.Forms.Panel             no-undo.
    define private variable winContainer                           as Progress.Windows.WindowContainer       no-undo.
    
    //End of Container
    
    //selected Open Tab
    define private variable tabPageSelect                          as System.Windows.Forms.TabPage           no-undo.
    define private variable tabPagemakeSelect                      as logical                                no-undo.
    
    //End of selected Open Tab
    
    //Notification Bar
    define private variable NotificationExpand                     as logical                                no-undo.
    
    define temp-table TempNotificationList no-undo
        field NotificationDetails as character .
        
    //End of Notification Bar
    
    //Side Manu Bar
    define private variable SubMenu                     as System.Windows.Forms.Panel  no-undo.
    define private variable SubMenuHandel               as handle                      no-undo.
    define private variable SubMenuClass                as class                       Progress.Lang.Object.
    
    define private variable LocalMenuBarExpand          as logical                     no-undo.
    
    define private variable FavSubButton                as System.Windows.Forms.Button no-undo. 
    define private variable CheckOpenScreenFavSubButton as System.Windows.Forms.Button no-undo. 
    define private variable FavBTNColumn                as integer                     initial 0 no-undo.
    define private variable FavBTNRow                   as integer                     initial 0 no-undo.
    
    define private variable NotSubButton                as System.Windows.Forms.Button no-undo. 
    define private variable NotBTNColumn                as integer                     initial 0 no-undo.
    define private variable NotBTNRow                   as integer                     initial 0 no-undo.
    
    define private variable LocalPinSelected            as logical                     initial no no-undo.
    
    define private variable NotificationState           as logical                     initial no no-undo.
    
    //End Of Side Menu Bar
    
    //ChatBot
    define private variable localchatbot as class MainMenu.ChatBot no-undo.
    define private variable ChatBotPanel as class System.Windows.Forms.Panel. 
    define private variable localtab as System.Windows.Forms.TabPage no-undo.
    //End of ChatBot
    
    
    //Temp Table for Open Screen
    
    define temp-table OpenScreen
        field TabName        as character
        field TabProgramName as character
        field TabHandel      as class     Progress.Lang.Object.
        
    //End of Temp Table for Open Screen
    
    //json & Temp table
    
    define         variable cSourceType     as character                        no-undo.
    define         variable cReadMode       as character                        no-undo.
    define         variable cFile           as character                        no-undo.
    define         variable lRetOK          as logical                          no-undo.
    define         variable hDSet           as handle                           no-undo.
    define private variable tabPage1        as System.Windows.Forms.TabPage     no-undo.
    define private variable windowContainer as Progress.Windows.WindowContainer no-undo.

    define temp-table JsonHeader
        field UserName as character.
 
    define temp-table UserModule serialize-name "Module"
        field ModuleID   as character serialize-hidden
        field ModuleName as character serialize-name "Module Name".

    define temp-table UserModuleFolder serialize-name "Folder"
        field ModuleID   as character serialize-hidden
        field FolderID   as integer   serialize-hidden
        field FolderName as character serialize-name "Folder Name".

    define temp-table UserModuleFolderMenu serialize-name "Menu"
        field FolderID    as integer   serialize-hidden
        field MenuID      as integer   serialize-hidden
        field MenuName    as character serialize-name "Menu Name"
        field ProgramName as character serialize-name "File Name".

    define dataset hDSet serialize-name "User Access" for UserModule, UserModuleFolder, UserModuleFolderMenu                              
        data-relation Relation01 for UserModule, UserModuleFolder relation-fields(ModuleID, ModuleID) nested
        data-relation Relation02 for UserModuleFolder, UserModuleFolderMenu relation-fields(FolderID, FolderID) nested.  
       
    //end of json & Temp Table
        
    constructor public MainMenu ():
        
        super().
        InitializeComponent().
        ProcessJsonData().
        // FavoritePanelCustomizeDesing(). //Side Menu Bar Operation
        this-object:ComponentsCollection:ADD(this-object:components).
        catch e as Progress.Lang.Error:
            undo, throw e.
        end catch.

    end constructor.

/*------------------------------------------------------------------------------
     Purpose:Chat Bot
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    method private void Assistant_Click( input sender as System.Object, input e as System.EventArgs ):
        localchatbot = new MainMenu.ChatBot().
        localchatbot:TopLevel = false.
        localchatbot:Dock = DockStyle:fill.
        
        CreateTab("ChatBot").
        
        this-object:localtab:Controls:Add(this-object:localchatbot).
        localchatbot:Show().
        return.

    end method.

	method private void CreateTab(input tabname as character):     // Create a tab
	    localtab = new System.Windows.Forms.TabPage().
	    this-object:localtab:Location = new System.Drawing.Point(4, 22).
        this-object:localtab:Name = tabname.
        this-object:localtab:Padding = new System.Windows.Forms.Padding(3).
        this-object:localtab:Size = new System.Drawing.Size(697, 417).
        this-object:localtab:TabIndex = 10.
        this-object:localtab:Text = tabname.
        this-object:localtab:UseVisualStyleBackColor = true.
        this-object:tabControl1:Controls:Add(this-object:localtab).
        this-object:tabControl1:SelectedTab = this-object:localtab.
       
	end method.
	
	/* ------------------------------------------- End Of Chat Bot --------------------------- */

    /*------------------------------------------------------------------------------ -----------------------------------------------------
     Purpose: Call Super Procedures
     Notes:
    ------------------------------------------------------------------------------ -----------------------------------------------------*/

    method private void SuperProceduresProc():
        /* Run Persistent Procedures and SESSION:SUPER-PROCEDURES */ 
        {IncludeFiles\SuperProcedure-Definitions.i}

        {IncludeFiles\SuperProcedureERP-Definitions.i}

        //{IncludeFiles\System-DefaultFunctions.i}
        
    end method.
    
    /*------------------------------------------------------------------------------ -----------------------------------------------------
     Purpose: Open in Full Screen Mode
     Notes: OnLoad Event
    ------------------------------------------------------------------------------ -----------------------------------------------------*/
    
    @VisualDesigner.
    method private void MainMenuOnLoad( input sender as System.Object, input e as System.EventArgs ):
        this-object:WindowState = System.Windows.Forms.FormWindowState:Maximized.
        
        FavoritePanelCustomizeDesing(). //Side Menu Bar Operation
        CustomizeColourMode().          //UI Colour Set and Changes
        
        return.

    end method.

    /*------------------------------------------------------------------------------ -----------------------------------------------------
     Purpose: Side Menu Bar All Functions and Operations
     Notes:
    ------------------------------------------------------------------------------ ----------------------------------------------------- */
    
    
    /*-------------- Purpose: Side Sub Menu Hide And Visible and Pin/UnPin Icon Change --------------*/
     
    @VisualDesigner.
    method private void FavoritePanelCustomizeDesing():      //Initial Display Screen By Defult All Hide The Panel
    
        for each UserProfile where
        //UserProfile.OperatingUnit = "" and
            UserProfile.UserProfile = "admin"
            no-lock:
         
            //if UserProfile.Pin then
            if yes then                // This requirment for only this version (disable Pin Proporty)
            do:
                this-object:menubar:width = this-object:menubar:MaximumSize:Width.       // If User Select As Pin Then Its Make By Defults as Pin For Next Time Login
                //this-object:MenuBarPictureBox:Image = imageList:Images[2].             // Change The Icon Of OpenMenu/CloseMenu In MenuBarPictureBox 
                this-object:FavSubMenupanel:Visible = false.
                this-object:NotSubMenupanel:Visible = false.
                createInsideFavTabProc().
                createInsideNotificationTabProc().
                
                /* **************************************************************** */
                this-object:FavSubMenupanel:Visible = true.                              // This requirment for only this version (Fav Sab Menu Alway open when User initially login)
            /* **************************************************************** */
                
            end.
            else
            do:
                this-object:menubar:width = this-object:menubar:MinimumSize:Width.
                //this-object:MenuBarPictureBox:Image = imageList:Images[1].
                this-object:FavSubMenupanel:Visible = false.
                this-object:NotSubMenupanel:Visible = false.
                createInsideFavTabProc().
                createInsideNotificationTabProc().
            end.
        end. 
        
        return.

    end method.
    
    /*-------------- Purpose: Process For Creation Dynamically Sub-Favourites Button Under Favourite Button --------------*/
    
    @VisualDesigner.
    method private void createInsideFavTabProc():
        
        define variable i                  as integer no-undo.
        define variable localFavBtnCounter as integer initial 0 no-undo.
        
        for each UserProfileMenuFavourites where
            UserProfileMenuFavourites.OperatingUnit = "norex1" and
            UserProfileMenuFavourites.UserProfile = "admin" 
            no-lock,
            first Folder where
            Folder.ModuleID = UserProfileMenuFavourites.ModuleID and 
            Folder.FolderNo = UserProfileMenuFavourites.FolderNo
            no-lock:
            //do i = 1 to 20:

            find first MenuItem where 
                MenuItem.ModuleID = Folder.ModuleID and
                MenuItem.FolderNo = Folder.FolderNo and
                MenuItem.MenuItemNo = processware.UserProfileMenuFavourites.MenuItemNo 
                no-lock no-error.
                    
            if available MenuItem then
            do:
                
                assign 
                    localFavBtnCounter = localFavBtnCounter + 1 .
                CreateFavDynamicBottonProc(MenuItem.MenuItemName,MenuItem.ProgramName,localFavBtnCounter).
                
            end.
                
        end.
    end method.
    
    method private void CreateFavDynamicBottonProc(input inBottonName as character,input inProgramName as character,input inlocalFavBtnCounter as integer):   //Create Botton Under Favourite Button
        
        define variable FavBtnHight as integer initial 29 no-undo.
        
        this-object:FavSubButton = new System.Windows.Forms.Button().
        
        this-object:FavSubButton:FlatAppearance:BorderSize = 0.
        this-object:FavSubButton:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
        this-object:FavSubButton:ForeColor = System.Drawing.Color:Gainsboro.
        this-object:FavSubButton:Location = new System.Drawing.Point(FavBTNColumn, FavBTNRow).
        this-object:FavSubButton:Name = inBottonName.
        this-object:FavSubButton:Padding = new System.Windows.Forms.Padding(35, 0, 0, 0).
        this-object:FavSubButton:Size = new System.Drawing.Size(160, 23).
        this-object:FavSubButton:TabIndex = 8.
        this-object:FavSubButton:Text = inBottonName.
        this-object:FavSubButton:tag = inProgramName.
        this-object:FavSubButton:TextAlign = System.Drawing.ContentAlignment:MiddleLeft.
        this-object:FavSubButton:UseCompatibleTextRendering = true.
        this-object:FavSubButton:UseVisualStyleBackColor = true. 
        
        this-object:FavSubMenupanel:Controls:Add(this-object:FavSubButton). //Add Newly Created Botton into Favorite Drop Down Panel List
        
        if inlocalFavBtnCounter <= 10 then
        do:
            FavBtnHight = FavBtnHight * inlocalFavBtnCounter.
            this-object:FavSubMenupanel:Size = new System.Drawing.Size(185, FavBtnHight).
        end.
        else
        do:
            FavBtnHight = FavBtnHight * 10.
            this-object:FavSubMenupanel:Size = new System.Drawing.Size(185, FavBtnHight).
        end.
        
        FavBTNRow = FavBTNRow + 23.
        
        this-object:FavSubButton:Click:Subscribe(this-object:CheckOpenScreenProc).
    end method.
    
    /*-------------- Purpose: Process For Creation All Sub Dynamic Notification Button Under Notification Button --------------*/
    
    @VisualDesigner.
    method private void TimerReloadNotificatonProc( input sender as System.Object, input e as System.EventArgs ): // Notification Panel Automatic Reload every Time Interval
    
        this-object:NotSubMenupanel:Visible = false.                //1st Its hide the notification panel
        this-object:NotSubMenupanel:Controls:Clear().               //clear all the button appear inside notification panel
        createInsideNotificationTabProc().                          //build all the notification button inside nitification panel
        this-object:NotSubMenupanel:Visible = NotificationState.    //diplay/hide the notification panel if priviously user display/hide
        
        return.
    
    end method.
     
    @VisualDesigner.
    method private void createInsideNotificationTabProc():
        
        define variable localNotBtnCounter       as integer initial 0 no-undo.
        define variable LocalNotificationCounter as integer initial 0 no-undo.
        
        for each UserNotification where
            UserNotification.UserProfile = "admin"  
            no-lock by UserNotification.NotificationDetails descending:
                
            localNotBtnCounter = localNotBtnCounter + 1. 
            CreateNotDynamicBottonProc(UserNotification.NotificationDetails , localNotBtnCounter).
            
            if UserNotification.NotificationStatus = "Open" then
            do:
                assign 
                    LocalNotificationCounter = LocalNotificationCounter + 1.
                define variable NotForm as class Akash.NotificationToast no-undo.
                NotForm = new Akash.NotificationToast(UserNotification.NotificationDetails, LocalNotificationCounter).
                NotForm:show().
                //wait-for System.Windows.Forms.Application:Run(NotForm).
                //NotForm:Close().
                //this-object:ResumeLayout(false).
            end.
            
        end.
        //TimerReloadNotificaton:Stop().
    end method.
    
    method private void CreateNotDynamicBottonProc(input inNotification as character , input inlocalNotBtnCounter as integer):                 //Create Botton Under Notification Button
    
        define variable NotBtnHight as integer initial 29 no-undo.
    
        this-object:NotSubButton = new System.Windows.Forms.Button().
        
        this-object:NotSubButton:FlatAppearance:BorderSize = 0.
        this-object:NotSubButton:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
        this-object:NotSubButton:Dock = System.Windows.Forms.DockStyle:Top.
        this-object:NotSubButton:ForeColor = System.Drawing.Color:Gainsboro.
        this-object:NotSubButton:Location = new System.Drawing.Point(NotBTNColumn, NotBTNRow).
        this-object:NotSubButton:Name = inNotification.
        this-object:NotSubButton:Padding = new System.Windows.Forms.Padding(35, 0, 0, 0).
        this-object:NotSubButton:Size = new System.Drawing.Size(160, 23).
        this-object:NotSubButton:TabIndex = 8.
        this-object:NotSubButton:Text = inNotification.
        this-object:NotSubButton:tag = inNotification.
        this-object:NotSubButton:TextAlign = System.Drawing.ContentAlignment:MiddleLeft.
        this-object:NotSubButton:UseCompatibleTextRendering = true.
        this-object:NotSubButton:UseVisualStyleBackColor = true. 
        
        this-object:NotSubMenupanel:Controls:Add(this-object:NotSubButton). //Add Newly Created Botton into Notification Drop Down Panel List
        
        if inlocalNotBtnCounter <= 10 then
        do:
            NotBtnHight = NotBtnHight * inlocalNotBtnCounter.
            this-object:NotSubMenupanel:Size = new System.Drawing.Size(185, NotBtnHight).
        end.
        else
        do:
            NotBtnHight = NotBtnHight * 10.
            this-object:NotSubMenupanel:Size = new System.Drawing.Size(185, NotBtnHight).
        end.
       
        assign 
            NotBTNRow = NotBTNRow + 23.
    end method.

    /*-------------- Purpose: Process For Click Event For MenuBarPictureBox --------------*/
     
    @VisualDesigner.
    method private void pictureBox1_Click( input sender as System.Object, input e as System.EventArgs ):
        
        /*   for each UserProfile where               // Check Pin and Unpin . If its Pin then animation will Stop
           //UserProfile.OperatingUnit = "" and
               UserProfile.UserProfile = "admin"
               no-lock:
               if UserProfile.Pin = no then
               do: 
                   HideSubMenu().
                   TimerMenuBar:Start().
               end.
           end. */
        
        return.

    end method.
    
    /*-------------- Purpose: Hide And Visible Property For Favorite and Notification Sub Button --------------*/
    
    method private void HideSubMenu():                                    //Display Screen Hide By Button
        if (this-object:FavSubMenupanel:Visible = true) then
        do:
            this-object:FavSubMenupanel:Visible = false.
        end.
        
        if (this-object:NotSubMenupanel:Visible = true) then
        do:
            this-object:NotSubMenupanel:Visible = false.
        end.
        
        if LocalMenuBarExpand = no then
        do:
            this-object:BTNFavorite:Name = "Favorite".
            this-object:BTNNotification:Name = "Notification".
            this-object:BTNTODO:Name = "TO DO".
        end.
        return.

    end method. 
    
    @VisualDesigner.
    method private void BTNFavorite_Click( input sender as System.Object, input e as System.EventArgs ): //Hide And View Property For Favorite
        if (this-object:FavSubMenupanel:Visible = false) then
        do:
            HideSubMenu().
            this-object:FavSubMenupanel:Visible = true.
        end.
        else
        do:
            this-object:FavSubMenupanel:Visible = false.
        end. 
        
        return.

    end method.
    
    @VisualDesigner.
    method private void BTNNotification_Click( input sender as System.Object, input e as System.EventArgs ): //Hide And View Property For Notification
        if (this-object:NotSubMenupanel:Visible = false) then
        do:
            HideSubMenu().
            this-object:NotSubMenupanel:Visible = true.
            assign 
                NotificationState = true.
        end.
        else
        do:
            this-object:NotSubMenupanel:Visible = false.
            assign 
                NotificationState = false.
        end. 
        
        return.

    end method.
    
    /*-------------- Purpose: Visualization The Sub Item Under Favorite and Notification Manu --------------*/
    
    @VisualDesigner.

    method private void VisibleSubMenu( input sender as System.Object, input e as System.Windows.Forms.PaintEventArgs):  //Display Screen Visible By Button
        if (this-object:FavSubMenupanel:Visible = false) then
        do:
            HideSubMenu().
            this-object:FavSubMenupanel:Visible = true.
        end.
        else
            this-object:FavSubMenupanel:visible = false.
        
        return.

    end method.
    
    /*-------------- Purpose: Side Bar Open and Close Slow animation(Timer Function) --------------*/
    
    @VisualDesigner.
    method private void MenuBarTimerTick( input sender as System.Object, input e as System.EventArgs ): 
        if (LocalMenuBarExpand) then  //if menubar is already expanded(Maximized Mode) ,And do it Minimized Mode
        do:    
            //this-object:MenuBarPictureBox:Image = imageList:Images[1].
            this-object:menubar:width = (this-object:menubar:width) - 10.
            if(this-object:menubar:width = this-object:menubar:MinimumSize:Width ) then
            do:
                assign 
                    LocalMenuBarExpand = false.
                TimerMenuBar:Stop().
            end.
        end.
        else        // if  menubar is already minimized , and do it to Maximized Mode
        do:
            //this-object:MenuBarPictureBox:Image = imageList:Images[2].
            this-object:menubar:width = (this-object:menubar:width) + 10.
            if (this-object:menubar:width = this-object:menubar:MaximumSize:Width ) then
            do:
                assign 
                    LocalMenuBarExpand = true.
                TimerMenuBar:Stop().
            end.
        end.
        
        return.

    end method.
    
    /*-------------- Purpose: Pin And Unpin Function --------------*/
    
    @VisualDesigner.
    method private void PinPictureBoxClick( input sender as System.Object, input e as System.EventArgs ): // Store Pin/Unpin Data According to Individual User
    
        /*    for first UserProfile where
            //UserProfile.OperatingUnit = "" and
                UserProfile.UserProfile = "admin"
                exclusive-lock:
                    
                if UserProfile.Pin then
                do:
                    assign 
                        UserProfile.Pin = no.
                        
                    this-object:PINPictureBox:Image = imageList:Images[4].
                end.
                else
                do:
                    assign 
                        UserProfile.Pin = yes.
                        
                    this-object:PINPictureBox:Image = imageList:Images[3].
                end.
                
            end. */
        return.

    end method.

    /*-------------- Purpose: Process For Favorite Sub Button Clicked --------------*/
    
    method private void CheckOpenScreenProc( input sender as System.Object, input e as System.EventArgs ): //Check Open Screen And Open Window file in New Tab
        define variable ClickedBTN     as System.Windows.Forms.Button no-undo. 
        define variable ClickedBTNTag  as character                   no-undo.
        define variable ClickedBTNName as character                   no-undo.
        
        assign 
            ClickedBTN     = cast(sender,System.Windows.Forms.Button)
            ClickedBTNTag  = ClickedBTN:Tag
            ClickedBTNName = ClickedBTN:Text.
               
        find first OpenScreen where
            OpenScreen.TabName = ClickedBTNName and
            OpenScreen.TabProgramName = ClickedBTNTag
            no-lock no-error.
            
        if available OpenScreen then
        do:
        end.
            
        if not available OpenScreen then
        do: 
            this-object:buildTabContainer(ClickedBTNName,ClickedBTNTag). 
        end.
    end method.
    
    /*-------------- Purpose: Process For UI Color Changes --------------*/
    
    method private void CustomizeColourMode():
    end method.
    

    /*------------------------------------------------------------------------------ -----------------------------------------------------
     Purpose: Create Top Menu Strip And Functionality Open Screen Into Tab Format
     Notes: 
    ------------------------------------------------------------------------------ -----------------------------------------------------*/
    
    /*-------------- Purpose: Process For Add Main Menu (1st Layer Menu) --------------*/
    
    method private void buildmainmenu(input inlocalmenuname as character): // Add Main Menu (1st Menu Bar)
        
        define variable arrayvar1 as System.Windows.Forms.ToolStripItem no-undo.
        this-object:CreateMainMenuToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem().
        this-object:CreateMainMenuToolStripMenuItem:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(15)), System.Convert:ToInt32(System.Convert:ToByte(20)), System.Convert:ToInt32(System.Convert:ToByte(18))).
        this-object:CreateMainMenuToolStripMenuItem:ForeColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(172)), System.Convert:ToInt32(System.Convert:ToByte(205)), System.Convert:ToInt32(System.Convert:ToByte(8))).
        this-object:CreateMainMenuToolStripMenuItem:Name = inlocalmenuname.
        this-object:CreateMainMenuToolStripMenuItem:Size = new System.Drawing.Size(85, 20).
        this-object:CreateMainMenuToolStripMenuItem:Text = inlocalmenuname.
        arrayvar1 = this-object:CreateMainMenuToolStripMenuItem.
        this-object:menuStrip1:Items:Add(arrayvar1).

        this-object:menuStrip1:ResumeLayout(false).
        this-object:menuStrip1:PerformLayout().
        this-object:ResumeLayout(false).
        this-object:PerformLayout().
    end method.
    
    /*-------------- Purpose: Process For Add Sub Menu Under Main Menu (2nd Layer Menu) --------------*/
    
    method private void buildsubmenu(input inSubMenuName as character): // Add Sub Menu (2nd Sub Menu)  
        this-object:CreateSubMenuMenuToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem().
        
        define variable arrayvar2 as System.Windows.Forms.ToolStripItem no-undo.
        arrayvar2 = this-object:CreateSubMenuMenuToolStripMenuItem.
        this-object:CreateMainMenuToolStripMenuItem:DropDownItems:Add(arrayvar2).
        
        this-object:CreateSubMenuMenuToolStripMenuItem:Name = inSubMenuName.
        this-object:CreateSubMenuMenuToolStripMenuItem:Size = new System.Drawing.Size(152, 22).
        this-object:CreateSubMenuMenuToolStripMenuItem:tag  = inSubMenuName.
        this-object:CreateSubMenuMenuToolStripMenuItem:Text = inSubMenuName.
        /*        this-object:CreateSubMenuMenuToolStripMenuItem:Click:Subscribe(this-object:submenuclick).*/
      
        this-object:menuStrip1:ResumeLayout(false).
        this-object:menuStrip1:PerformLayout().
        this-object:ResumeLayout(false).
        this-object:PerformLayout().
    end method.
    
    /*-------------- Purpose: Process For Add Sub-Sub Menu Under Sub Menu (3nd Layer Menu) --------------*/
    
    method private void buildsubmenulistitem(input inlocalmenuname as character , input inProgrammName as character): // Add Sub Menu Item (3rd Sub Menu)
        this-object:CreateSubMenuListMenuToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem().
        define variable arrayvar3 as System.Windows.Forms.ToolStripItem no-undo.
        arrayvar3 = this-object:CreateSubMenuListMenuToolStripMenuItem.
        this-object:CreateSubMenuMenuToolStripMenuItem:DropDownItems:Add(arrayvar3).
        
        this-object:CreateSubMenuListMenuToolStripMenuItem:Name = inlocalmenuname.
        this-object:CreateSubMenuListMenuToolStripMenuItem:Size = new System.Drawing.Size(152, 22).
        this-object:CreateSubMenuListMenuToolStripMenuItem:tag = inProgrammName.
        this-object:CreateSubMenuListMenuToolStripMenuItem:Text = inlocalmenuname.
        this-object:CreateSubMenuListMenuToolStripMenuItem:Click:Subscribe(this-object:CallSubMenuListItem). // Trigger Final Menu(3rd Menu) Method
        
        this-object:menuStrip1:ResumeLayout(false).
        this-object:menuStrip1:PerformLayout().
        this-object:ResumeLayout(false).
        this-object:PerformLayout().
    end method. 
    
    /*-------------- Purpose: Process For Open New Screen And Duplicate Screen --------------*/
    
    method private void CallSubMenuListItem(input sender as System.Object, input e as System.EventArgs):
        //Click response of menu item
        define variable MenuListItem     as System.Windows.Forms.ToolStripMenuItem no-undo.
        define variable MenuListItemTag  as character                              no-undo.
        define variable MenuListItemName as character                              no-undo.
        assign 
            MenuListItem     = cast(sender,System.Windows.Forms.ToolStripMenuItem)
            MenuListItemTag  = MenuListItem:tag
            MenuListItemName = MenuListItem:Text.
      
      
        //end of Click response of menu item
        
        this-object:intab = new System.Windows.Forms.TabPage().                  //incompliet
        
        find first OpenScreen where                     // Duplicate Open Screen not Applicable
            OpenScreen.TabName = MenuListItemName and
            OpenScreen.TabProgramName = MenuListItemTag
            no-lock no-error.
        
        if available OpenScreen then
        do: 
            assign 
                tabPagemakeSelect = yes.
            this-object:buildTabContainer(MenuListItemName,MenuListItemTag).
            message OpenScreen.TabHandel skip 1111
                view-as alert-box information buttons ok.
        end.
        
        if not available OpenScreen then
        do: 
            
            tabPagemakeSelect = no.
            this-object:buildTabContainer(MenuListItemName,MenuListItemTag).
        end.
        
        return.
    end method.
    
    method private void selectedTab():
        //this-object:tabControl1:SelectedTab
    end method.
    
    /*-------------- Purpose: Process For Open Window File(.W) Inside Container --------------*/
    
    method private void buildTabContainer(input inTabName as character, input inProgrammName as character): //Create a new tab,Close Button for all screen,New Container for all tab page,Window File(.W) persistent with Container
        if tabPagemakeSelect then
        do:
            this-object:tabControl1:SelectedTab = this-object:tabPage.
        end.
        
        if tabPagemakeSelect = no then
        do:
            //Tab Close Buttom
            this-object:CloseTab = new System.Windows.Forms.Button().
            define variable nestedvar2 as System.Windows.Forms.AnchorStyles no-undo.
            nestedvar2 = System.Windows.Forms.AnchorStyles:Top.
            this-object:CloseTab:Anchor = cast(Progress.Util.EnumHelper:Or(nestedvar2, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
            this-object:CloseTab:AutoSizeMode = System.Windows.Forms.AutoSizeMode:GrowAndShrink.
            this-object:CloseTab:Location = new System.Drawing.Point(927, 11).
            this-object:CloseTab:Size = new System.Drawing.Size(25, 32).
            this-object:CloseTab:Name = inTabName.
            this-object:CloseTab:ImageList = imageList.
            this-object:CloseTab:ImageIndex = 0.
            this-object:CloseTab:Click:Subscribe(this-object:CloseTabOnLoad). 
        //End of Tab close Buttom
        
        //Tab control
            this-object:tabPage = new System.Windows.Forms.TabPage().
            this-object:tabControl1:Controls:Add(this-object:tabPage).
            this-object:tabPage:Location = new System.Drawing.Point(4, 22).
            this-object:tabPage:Name = inTabName.
            this-object:tabPage:Padding = new System.Windows.Forms.Padding(3).
            this-object:tabPage:Size = new System.Drawing.Size(165, 84).
            this-object:tabPage:TabIndex = 2.
            this-object:tabPage:Text = inTabName.
            this-object:tabPage:UseVisualStyleBackColor = true.
            this-object:tabPage:Controls:Add(this-object:CloseTab).
            this-object:tabControl1:SelectedTab = this-object:tabPage.
        //End of Tab Control
        
            /*                        message this-object:tabControl1:SelectedTab:*/
            /*                            view-as alert-box info buttons ok.      */
        
        //container
            this-object:WinContainer = new Progress.Windows.WindowContainer().
            define variable nestedvar as System.Windows.Forms.AnchorStyles no-undo.
            nestedvar = cast(Progress.Util.EnumHelper:Or(cast(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
            this-object:WinContainer:Anchor = cast(Progress.Util.EnumHelper:Or(nestedvar, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
            this-object:WinContainer:BackColor = System.Drawing.Color:Transparent.
            this-object:WinContainer:size = new System.Drawing.Size( this-object:WIDTH, this-object:HEIGHT ). 
            this-object:tabPage:Controls:Add(this-object:WinContainer).
            this-object:WinContainer:Parent = tabPage.
        //End of Container

        //Call W file Inside Container
        message inProgrammName
        view-as alert-box info buttons ok.
            run value(inProgrammName) persistent set Containerhandle.
            ContainerWin = Containerhandle:current-window.
            WinContainer:EmbeddedWindow = ContainerWin.
            WinContainer:Location = new System.Drawing.Point(15,16).
            WinContainer:Show().
            run enable_UI in Containerhandle.  
        //End of calling W file
        
            create OpenScreen.
            assign 
                OpenScreen.TabName        = inTabName
                OpenScreen.TabProgramName = inProgrammName
                OpenScreen.TabHandel      = this-object:tabPage.
            /*            OpenScreen.TabHandel      = this-object:tabControl1.*/
            release OpenScreen. 
        
        end.
          
        this-object:tabControl1:ResumeLayout(false).
        this-object:tabPage:ResumeLayout(false).
        this-object:ResumeLayout(false).
    end method.
    
    method private void CloseTabOnLoad( input sender as System.Object, input e as System.EventArgs ):     // For Close Tab
        assign 
            tabPageSelected = this-object:tabControl1:SelectedTab
            tabPageName     = this-object:tabPageSelected:Name.
            
        for first OpenScreen where
            OpenScreen.TabName = tabPageName 
            no-lock:
            delete OpenScreen.
        end.
                                
        this-object:tabControl1:Controls:remove(this-object:tabPageSelected).
 
        this-object:tabControl1:ResumeLayout(false).
        this-object:ResumeLayout(false).
        return.

    end method.
    
    /*-------------- Purpose: Load Json Data Into Temp Table --------------*/
    
    method private void ProcessJsonData ():
        create dataset hDSet.
        assign
            cSourceType = "file"
            cFile       = "D:\AkashProject\AkashDemo\src\Akash\UseMenuData-01.json" 
            cReadMode   = "empty".

        dataset hDSet:read-json("file", cFile, "empty") no-error.
        
        for each UserModule 
            no-lock:
                
            buildmainmenu(UserModule.ModuleName).
                
            for each UserModuleFolder where
                UserModuleFolder.ModuleID = UserModule.ModuleID
                no-lock:
                    
                buildsubmenu(UserModuleFolder.FolderName).
                
                for each UserModuleFolderMenu where
                    UserModuleFolderMenu.FolderID = UserModuleFolder.FolderID
                    no-lock:
                        
                    buildsubmenulistitem(input UserModuleFolderMenu.MenuName , input UserModuleFolderMenu.ProgramName).
                    
                end.
            end.
        end.
    end method. 

    method private void InitializeComponent(  ):
        
        /* NOTE: The following method is automatically generated.
                
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
                
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        this-object:components = new System.ComponentModel.Container().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable resources as Progress.Util.ResourceManager no-undo.
        resources = new Progress.Util.ResourceManager("MainMenu").
        this-object:menuStrip1 = new System.Windows.Forms.MenuStrip().
        this-object:fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem().
        this-object:exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem().
        this-object:tabControl1 = new System.Windows.Forms.TabControl().
        this-object:tabPage1 = new System.Windows.Forms.TabPage().
        this-object:button1 = new System.Windows.Forms.Button().
        this-object:button3 = new System.Windows.Forms.Button().
        this-object:windowContainer = new Progress.Windows.WindowContainer().
        this-object:imageList = new System.Windows.Forms.ImageList(this-object:components).
        this-object:MenuBar = new System.Windows.Forms.Panel().
        this-object:AssistantPictureBox = new System.Windows.Forms.PictureBox().
        this-object:TODOPanel = new System.Windows.Forms.Panel().
        this-object:BTNTODO = new System.Windows.Forms.Button().
        this-object:NotSubMenupanel = new System.Windows.Forms.FlowLayoutPanel().
        this-object:NotificationPanel = new System.Windows.Forms.Panel().
        this-object:BTNNotification = new System.Windows.Forms.Button().
        this-object:FavSubMenupanel = new System.Windows.Forms.FlowLayoutPanel().
        this-object:FavoritePanel = new System.Windows.Forms.Panel().
        this-object:BTNFavorite = new System.Windows.Forms.Button().
        this-object:FavIcon = new System.Windows.Forms.Panel().
        this-object:PINPictureBox = new System.Windows.Forms.PictureBox().
        this-object:MenuBarPictureBox = new System.Windows.Forms.PictureBox().
        this-object:TimerMenuBar = new System.Windows.Forms.Timer(this-object:components).
        this-object:TimerReloadNotificaton = new System.Windows.Forms.Timer(this-object:components).
        this-object:menuStrip1:SuspendLayout().
        this-object:tabControl1:SuspendLayout().
        this-object:tabPage1:SuspendLayout().
        this-object:MenuBar:SuspendLayout().
        cast(this-object:AssistantPictureBox, System.ComponentModel.ISupportInitialize):BeginInit().
        this-object:TODOPanel:SuspendLayout().
        this-object:NotificationPanel:SuspendLayout().
        this-object:FavoritePanel:SuspendLayout().
        this-object:FavIcon:SuspendLayout().
        cast(this-object:PINPictureBox, System.ComponentModel.ISupportInitialize):BeginInit().
        cast(this-object:MenuBarPictureBox, System.ComponentModel.ISupportInitialize):BeginInit().
        this-object:SuspendLayout().
        /*  */
        /* menuStrip1 */
        /*  */
        this-object:menuStrip1:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(15)), System.Convert:ToInt32(System.Convert:ToByte(20)), System.Convert:ToInt32(System.Convert:ToByte(18))).
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar0 as System.Windows.Forms.ToolStripItem extent 1 no-undo.
        arrayvar0[1] = this-object:fileToolStripMenuItem.
        this-object:menuStrip1:Items:AddRange(arrayvar0).
        this-object:menuStrip1:Location = new System.Drawing.Point(0, 0).
        this-object:menuStrip1:Name = "menuStrip1".
        this-object:menuStrip1:Size = new System.Drawing.Size(1022, 24).
        this-object:menuStrip1:TabIndex = 0.
        this-object:menuStrip1:Text = "menuStrip1".
        /*  */
        /* fileToolStripMenuItem */
        /*  */
        this-object:fileToolStripMenuItem:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(15)), System.Convert:ToInt32(System.Convert:ToByte(20)), System.Convert:ToInt32(System.Convert:ToByte(18))).
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar1 as System.Windows.Forms.ToolStripItem extent 1 no-undo.
        arrayvar1[1] = this-object:exitToolStripMenuItem.
        this-object:fileToolStripMenuItem:DropDownItems:AddRange(arrayvar1).
        this-object:fileToolStripMenuItem:ForeColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(172)), System.Convert:ToInt32(System.Convert:ToByte(205)), System.Convert:ToInt32(System.Convert:ToByte(8))).
        this-object:fileToolStripMenuItem:Name = "fileToolStripMenuItem".
        this-object:fileToolStripMenuItem:Size = new System.Drawing.Size(37, 20).
        this-object:fileToolStripMenuItem:Text = "File".
        this-object:fileToolStripMenuItem:TextImageRelation = System.Windows.Forms.TextImageRelation:TextAboveImage.
        /*  */
        /* exitToolStripMenuItem */
        /*  */
        this-object:exitToolStripMenuItem:Name = "exitToolStripMenuItem".
        this-object:exitToolStripMenuItem:Size = new System.Drawing.Size(93, 22).
        this-object:exitToolStripMenuItem:Text = "Exit".
        /*  */
        /* tabControl1 */
        /*  */
        define variable nestedvar0 as System.Windows.Forms.AnchorStyles no-undo.
        nestedvar0 = cast(Progress.Util.EnumHelper:Or(cast(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        this-object:tabControl1:Anchor = cast(Progress.Util.EnumHelper:Or(nestedvar0, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        this-object:tabControl1:Controls:Add(this-object:tabPage1).
        this-object:tabControl1:Location = new System.Drawing.Point(185, 42).
        this-object:tabControl1:Name = "tabControl1".
        this-object:tabControl1:SelectedIndex = 0.
        this-object:tabControl1:Size = new System.Drawing.Size(837, 439).
        this-object:tabControl1:TabIndex = 1.
        /*  */
        /* tabPage1 */
        /*  */
        this-object:tabPage1:Controls:Add(this-object:button1).
        this-object:tabPage1:Controls:Add(this-object:button3).
        this-object:tabPage1:Controls:Add(this-object:windowContainer).
        this-object:tabPage1:Location = new System.Drawing.Point(4, 22).
        this-object:tabPage1:Name = "tabPage1".
        this-object:tabPage1:Padding = new System.Windows.Forms.Padding(3).
        this-object:tabPage1:Size = new System.Drawing.Size(829, 413).
        this-object:tabPage1:TabIndex = 0.
        this-object:tabPage1:Text = "Dashboard".
        this-object:tabPage1:UseVisualStyleBackColor = true.
        /*  */
        /* button1 */
        /*  */
        define variable nestedvar1 as System.Windows.Forms.AnchorStyles no-undo.
        nestedvar1 = System.Windows.Forms.AnchorStyles:Bottom.
        this-object:button1:Anchor = cast(Progress.Util.EnumHelper:Or(nestedvar1, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        this-object:button1:Location = new System.Drawing.Point(714, 368).
        this-object:button1:Name = "button1".
        this-object:button1:Size = new System.Drawing.Size(107, 29).
        this-object:button1:TabIndex = 7.
        this-object:button1:Text = "Not 3 Akash jjjjjjjjj".
        this-object:button1:UseCompatibleTextRendering = true.
        this-object:button1:UseVisualStyleBackColor = true.
        /*  */
        /* button3 */
        /*  */
        this-object:button3:FlatAppearance:BorderSize = 0.
        this-object:button3:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
        this-object:button3:ForeColor = System.Drawing.Color:Gainsboro.
        this-object:button3:Location = new System.Drawing.Point(346, 243).
        this-object:button3:Name = "button3".
        this-object:button3:Padding = new System.Windows.Forms.Padding(30, 0, 0, 0).
        this-object:button3:Size = new System.Drawing.Size(130, 39).
        this-object:button3:TabIndex = 6.
        this-object:button3:Text = "Not 3 Akash jjjjjjjjj".
        this-object:button3:TextAlign = System.Drawing.ContentAlignment:MiddleLeft.
        this-object:button3:TextImageRelation = System.Windows.Forms.TextImageRelation:TextBeforeImage.
        this-object:button3:UseCompatibleTextRendering = true.
        this-object:button3:UseVisualStyleBackColor = true.
        /*  */
        /* windowContainer */
        /*  */
        define variable nestedvar2 as System.Windows.Forms.AnchorStyles no-undo.
        nestedvar2 = cast(Progress.Util.EnumHelper:Or(cast(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        this-object:windowContainer:Anchor = cast(Progress.Util.EnumHelper:Or(nestedvar2, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        this-object:windowContainer:AutoSizeMode = System.Windows.Forms.AutoSizeMode:GrowAndShrink.
        this-object:windowContainer:BackColor = System.Drawing.Color:WhiteSmoke.
        this-object:windowContainer:Location = new System.Drawing.Point(2, 3).
        this-object:windowContainer:Name = "windowContainer".
        this-object:windowContainer:Size = new System.Drawing.Size(830, 407).
        this-object:windowContainer:TabIndex = 0.
        /*  */
        /* imageList */
        /*  */
        this-object:imageList:ImageStream = cast(resources:GetObject("imageList.ImageStream"), System.Windows.Forms.ImageListStreamer).
        this-object:imageList:TransparentColor = System.Drawing.Color:Transparent.
        this-object:imageList:Images:SetKeyName(0, "ButtonExitUp.bmp").
        this-object:imageList:Images:SetKeyName(1, "MenuClose.png").
        this-object:imageList:Images:SetKeyName(2, "MenuOpen.png").
        this-object:imageList:Images:SetKeyName(3, "Pin.png").
        this-object:imageList:Images:SetKeyName(4, "Unpin.png").
        this-object:imageList:Images:SetKeyName(5, "robotic.gif").
        /*  */
        /* MenuBar */
        /*  */
        define variable nestedvar3 as System.Windows.Forms.AnchorStyles no-undo.
        nestedvar3 = cast(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles).
        this-object:MenuBar:Anchor = cast(Progress.Util.EnumHelper:Or(nestedvar3, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        this-object:MenuBar:AutoScroll = true.
        this-object:MenuBar:AutoSizeMode = System.Windows.Forms.AutoSizeMode:GrowAndShrink.
        this-object:MenuBar:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(15)), System.Convert:ToInt32(System.Convert:ToByte(20)), System.Convert:ToInt32(System.Convert:ToByte(18))).
        this-object:MenuBar:Controls:Add(this-object:AssistantPictureBox).
        this-object:MenuBar:Controls:Add(this-object:TODOPanel).
        this-object:MenuBar:Controls:Add(this-object:NotSubMenupanel).
        this-object:MenuBar:Controls:Add(this-object:NotificationPanel).
        this-object:MenuBar:Controls:Add(this-object:FavSubMenupanel).
        this-object:MenuBar:Controls:Add(this-object:FavoritePanel).
        this-object:MenuBar:Controls:Add(this-object:FavIcon).
        this-object:MenuBar:Location = new System.Drawing.Point(0, 42).
        this-object:MenuBar:MaximumSize = new System.Drawing.Size(185, 0).
        this-object:MenuBar:MinimumSize = new System.Drawing.Size(31, 0).
        this-object:MenuBar:Name = "MenuBar".
        this-object:MenuBar:Size = new System.Drawing.Size(185, 432).
        this-object:MenuBar:TabIndex = 3.
        /*  */
        /* AssistantPictureBox */
        /*  */
        define variable nestedvar4 as System.Windows.Forms.AnchorStyles no-undo.
        nestedvar4 = System.Windows.Forms.AnchorStyles:Bottom.
        this-object:AssistantPictureBox:Anchor = cast(Progress.Util.EnumHelper:Or(nestedvar4, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        this-object:AssistantPictureBox:Image = cast(resources:GetObject("AssistantPictureBox.Image"), System.Drawing.Image).
        this-object:AssistantPictureBox:Location = new System.Drawing.Point(5, 290).
        this-object:AssistantPictureBox:Name = "AssistantPictureBox".
        this-object:AssistantPictureBox:Size = new System.Drawing.Size(78, 77).
        this-object:AssistantPictureBox:SizeMode = System.Windows.Forms.PictureBoxSizeMode:StretchImage.
        this-object:AssistantPictureBox:TabIndex = 5.
        this-object:AssistantPictureBox:TabStop = false.
        this-object:AssistantPictureBox:Click:Subscribe(this-object:Assistant_Click).
        /*  */
        /* TODOPanel */
        /*  */
        this-object:TODOPanel:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(15)), System.Convert:ToInt32(System.Convert:ToByte(20)), System.Convert:ToInt32(System.Convert:ToByte(18))).
        this-object:TODOPanel:Controls:Add(this-object:BTNTODO).
        this-object:TODOPanel:Dock = System.Windows.Forms.DockStyle:Top.
        this-object:TODOPanel:Location = new System.Drawing.Point(0, 159).
        this-object:TODOPanel:Name = "TODOPanel".
        this-object:TODOPanel:Size = new System.Drawing.Size(185, 31).
        this-object:TODOPanel:TabIndex = 7.
        /*  */
        /* BTNTODO */
        /*  */
        this-object:BTNTODO:Dock = System.Windows.Forms.DockStyle:Left.
        this-object:BTNTODO:FlatAppearance:BorderSize = 0.
        this-object:BTNTODO:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
        this-object:BTNTODO:ForeColor = System.Drawing.Color:Gainsboro.
        this-object:BTNTODO:Image = cast(resources:GetObject("BTNTODO.Image"), System.Drawing.Image).
        this-object:BTNTODO:ImageAlign = System.Drawing.ContentAlignment:MiddleLeft.
        this-object:BTNTODO:Location = new System.Drawing.Point(0, 0).
        this-object:BTNTODO:Name = "BTNTODO".
        this-object:BTNTODO:Size = new System.Drawing.Size(123, 31).
        this-object:BTNTODO:TabIndex = 6.
        this-object:BTNTODO:Text = "TO DO".
        this-object:BTNTODO:UseCompatibleTextRendering = true.
        this-object:BTNTODO:UseVisualStyleBackColor = true.
        /*  */
        /* NotSubMenupanel */
        /*  */
        this-object:NotSubMenupanel:AutoScroll = true.
        this-object:NotSubMenupanel:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(73)), System.Convert:ToInt32(System.Convert:ToByte(62)), System.Convert:ToInt32(System.Convert:ToByte(96))).
        this-object:NotSubMenupanel:Dock = System.Windows.Forms.DockStyle:Top.
        this-object:NotSubMenupanel:Location = new System.Drawing.Point(0, 135).
        this-object:NotSubMenupanel:Name = "NotSubMenupanel".
        this-object:NotSubMenupanel:Size = new System.Drawing.Size(185, 24).
        this-object:NotSubMenupanel:TabIndex = 8.
        /*  */
        /* NotificationPanel */
        /*  */
        this-object:NotificationPanel:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(15)), System.Convert:ToInt32(System.Convert:ToByte(20)), System.Convert:ToInt32(System.Convert:ToByte(18))).
        this-object:NotificationPanel:Controls:Add(this-object:BTNNotification).
        this-object:NotificationPanel:Dock = System.Windows.Forms.DockStyle:Top.
        this-object:NotificationPanel:Location = new System.Drawing.Point(0, 104).
        this-object:NotificationPanel:Name = "NotificationPanel".
        this-object:NotificationPanel:Size = new System.Drawing.Size(185, 31).
        this-object:NotificationPanel:TabIndex = 7.
        /*  */
        /* BTNNotification */
        /*  */
        this-object:BTNNotification:Dock = System.Windows.Forms.DockStyle:Left.
        this-object:BTNNotification:FlatAppearance:BorderSize = 0.
        this-object:BTNNotification:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
        this-object:BTNNotification:ForeColor = System.Drawing.Color:Gainsboro.
        this-object:BTNNotification:Image = cast(resources:GetObject("BTNNotification.Image"), System.Drawing.Image).
        this-object:BTNNotification:ImageAlign = System.Drawing.ContentAlignment:MiddleLeft.
        this-object:BTNNotification:Location = new System.Drawing.Point(0, 0).
        this-object:BTNNotification:Name = "BTNNotification".
        this-object:BTNNotification:Size = new System.Drawing.Size(120, 31).
        this-object:BTNNotification:TabIndex = 3.
        this-object:BTNNotification:Text = "Notification".
        this-object:BTNNotification:UseCompatibleTextRendering = true.
        this-object:BTNNotification:UseVisualStyleBackColor = true.
        this-object:BTNNotification:Click:Subscribe(this-object:BTNNotification_Click).
        /*  */
        /* FavSubMenupanel */
        /*  */
        this-object:FavSubMenupanel:AutoScroll = true.
        this-object:FavSubMenupanel:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(73)), System.Convert:ToInt32(System.Convert:ToByte(62)), System.Convert:ToInt32(System.Convert:ToByte(96))).
        this-object:FavSubMenupanel:Dock = System.Windows.Forms.DockStyle:Top.
        this-object:FavSubMenupanel:Location = new System.Drawing.Point(0, 80).
        this-object:FavSubMenupanel:Name = "FavSubMenupanel".
        this-object:FavSubMenupanel:Size = new System.Drawing.Size(185, 24).
        this-object:FavSubMenupanel:TabIndex = 4.
        /*  */
        /* FavoritePanel */
        /*  */
        this-object:FavoritePanel:Controls:Add(this-object:BTNFavorite).
        this-object:FavoritePanel:Dock = System.Windows.Forms.DockStyle:Top.
        this-object:FavoritePanel:Location = new System.Drawing.Point(0, 49).
        this-object:FavoritePanel:Name = "FavoritePanel".
        this-object:FavoritePanel:Size = new System.Drawing.Size(185, 31).
        this-object:FavoritePanel:TabIndex = 3.
        /*  */
        /* BTNFavorite */
        /*  */
        this-object:BTNFavorite:Dock = System.Windows.Forms.DockStyle:Left.
        this-object:BTNFavorite:FlatAppearance:BorderSize = 0.
        this-object:BTNFavorite:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
        this-object:BTNFavorite:ForeColor = System.Drawing.Color:Gainsboro.
        this-object:BTNFavorite:Image = cast(resources:GetObject("BTNFavorite.Image"), System.Drawing.Image).
        this-object:BTNFavorite:ImageAlign = System.Drawing.ContentAlignment:MiddleLeft.
        this-object:BTNFavorite:Location = new System.Drawing.Point(0, 0).
        this-object:BTNFavorite:Name = "BTNFavorite".
        this-object:BTNFavorite:Size = new System.Drawing.Size(120, 31).
        this-object:BTNFavorite:TabIndex = 1.
        this-object:BTNFavorite:Text = "Favorites".
        this-object:BTNFavorite:UseCompatibleTextRendering = true.
        this-object:BTNFavorite:UseVisualStyleBackColor = true.
        this-object:BTNFavorite:Click:Subscribe(this-object:BTNFavorite_Click).
        /*  */
        /* FavIcon */
        /*  */
        this-object:FavIcon:Controls:Add(this-object:PINPictureBox).
        this-object:FavIcon:Controls:Add(this-object:MenuBarPictureBox).
        this-object:FavIcon:Dock = System.Windows.Forms.DockStyle:Top.
        this-object:FavIcon:Location = new System.Drawing.Point(0, 0).
        this-object:FavIcon:Name = "FavIcon".
        this-object:FavIcon:Size = new System.Drawing.Size(185, 49).
        this-object:FavIcon:TabIndex = 0.
        /*  */
        /* PINPictureBox */
        /*  */
        this-object:PINPictureBox:Cursor = System.Windows.Forms.Cursors:Arrow.
        this-object:PINPictureBox:Location = new System.Drawing.Point(151, 10).
        this-object:PINPictureBox:Name = "PINPictureBox".
        this-object:PINPictureBox:Size = new System.Drawing.Size(26, 25).
        this-object:PINPictureBox:SizeMode = System.Windows.Forms.PictureBoxSizeMode:StretchImage.
        this-object:PINPictureBox:TabIndex = 1.
        this-object:PINPictureBox:TabStop = false.
        this-object:PINPictureBox:Click:Subscribe(this-object:PinPictureBoxClick).
        /*  */
        /* MenuBarPictureBox */
        /*  */
        this-object:MenuBarPictureBox:Cursor = System.Windows.Forms.Cursors:Arrow.
        this-object:MenuBarPictureBox:Location = new System.Drawing.Point(5, 9).
        this-object:MenuBarPictureBox:Name = "MenuBarPictureBox".
        this-object:MenuBarPictureBox:Size = new System.Drawing.Size(25, 26).
        this-object:MenuBarPictureBox:SizeMode = System.Windows.Forms.PictureBoxSizeMode:StretchImage.
        this-object:MenuBarPictureBox:TabIndex = 0.
        this-object:MenuBarPictureBox:TabStop = false.
        this-object:MenuBarPictureBox:Click:Subscribe(this-object:pictureBox1_Click).
        /*  */
        /* TimerMenuBar */
        /*  */
        this-object:TimerMenuBar:Tick:Subscribe(this-object:MenuBarTimerTick).
        /*  */
        /* TimerReloadNotificaton */
        /*  */
        this-object:TimerReloadNotificaton:Enabled = true.
        this-object:TimerReloadNotificaton:Interval = 30000.
        this-object:TimerReloadNotificaton:Tick:Subscribe(this-object:TimerReloadNotificatonProc).
        /*  */
        /* MainMenu */
        /*  */
        this-object:AccessibleName = "".
        this-object:AutoSize = true.
        this-object:AutoSizeMode = System.Windows.Forms.AutoSizeMode:GrowAndShrink.
        this-object:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(246)), System.Convert:ToInt32(System.Convert:ToByte(246)), System.Convert:ToInt32(System.Convert:ToByte(244))).
        this-object:ClientSize = new System.Drawing.Size(1022, 493).
        this-object:Controls:Add(this-object:MenuBar).
        this-object:Controls:Add(this-object:tabControl1).
        this-object:Controls:Add(this-object:menuStrip1).
        this-object:Icon = cast(resources:GetObject("$this.Icon"), System.Drawing.Icon).
        this-object:Name = "MainMenu".
        this-object:Text = "ProcessWare".
        this-object:Load:Subscribe(this-object:MainMenuOnLoad).
        this-object:menuStrip1:ResumeLayout(false).
        this-object:menuStrip1:PerformLayout().
        this-object:tabControl1:ResumeLayout(false).
        this-object:tabPage1:ResumeLayout(false).
        this-object:MenuBar:ResumeLayout(false).
        cast(this-object:AssistantPictureBox, System.ComponentModel.ISupportInitialize):EndInit().
        this-object:TODOPanel:ResumeLayout(false).
        this-object:NotificationPanel:ResumeLayout(false).
        this-object:FavoritePanel:ResumeLayout(false).
        this-object:FavIcon:ResumeLayout(false).
        cast(this-object:PINPictureBox, System.ComponentModel.ISupportInitialize):EndInit().
        cast(this-object:MenuBarPictureBox, System.ComponentModel.ISupportInitialize):EndInit().
        this-object:ResumeLayout(false).
        this-object:PerformLayout().
        catch e as Progress.Lang.Error:
            undo, throw e.
        end catch.
    end method.

    destructor public MainMenu ( ):

    end destructor.

end class.