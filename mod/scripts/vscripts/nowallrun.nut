global function NoWallrun_ClientInit

void function NoWallrun_ClientInit(){
    thread NoWallrun()
}

void function NoWallrun(){
    while( GetGameState() < 3 )
        wait 0

    for(;;){
        entity p = GetLocalClientPlayer()
        while( !IsValid( p ) || !( p.IsWallRunning() ) )
            WaitFrame()

        p.ClientCommand( "+duck" )
        wait 0
        p.ClientCommand( "-duck" )
    }
}
