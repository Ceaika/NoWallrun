global function NoWallrun_ClientInit

bool nwr_started = false
bool nwr_duckHeld = false

void function NoWallrun_ClientInit()
{
    if ( nwr_started )
        return

    nwr_started = true
    thread NoWallrun()
}

void function NoWallrun()
{
    while ( true )
    {
        entity p = GetLocalViewPlayer()

        if ( p == null || !IsValid( p ) )
        {
            WaitFrame()
            continue
        }

        if ( p.IsWallRunning() )
        {
            p.ClientCommand( "+duck" )
            nwr_duckHeld = true
        }
        else
        {
            if ( nwr_duckHeld )
            {
                p.ClientCommand( "-duck" )
                nwr_duckHeld = false
            }
        }

        WaitFrame()
    }
}
