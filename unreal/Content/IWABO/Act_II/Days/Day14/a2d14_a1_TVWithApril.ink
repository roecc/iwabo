INCLUDE ../globals.ink

== D14_WatchingNaruto
{ not rf("tvWithAprilCin"):
April is noodling absentmindedly on her Guitar, watching TV
Hearing footsteps behind her, April snaps out of her trance and whips around before quickly scambling for the remote, only to relax once she realises it's you.
A: Good morning Dad
A: I thought you were Mom for a moment #sf_tvWithAprilCin
}
*[Hm? #ua_1]
    ->D14_WatchingNaruto2
+[\[Leave\]]
    ->DONE

= D14_WatchingNaruto2
*[Scootch,]
    ** [What are we watching?]
        A: Oturan.
        ***[Otu-what?]
            A: You know, the show June keeps bringing up. We used to watch it a lot.
            A: Kinda bummed we will never see the finale..
        ***[That kiddie show again?]
            A: It's pretty dumb. But June really loves it.
            **** [Which is why you're the one watching it?]
                A: It's... 
                A: research!
                A: I won't tell you for what, so don't even ask.
        --- ->D14_WatchingNaruto2
                
    ** [My turn.]
        For a brief moment Aprils shoots daggers at you, before thinking better of it, grabbing her Guitar and slinking off. #um_a_-20
        Time for some you-time with...
        ***[Taped mid-season Football!]
        ***[Magnum, P.I.]
        ***[History Channel Documentaries,]
            the full collection!
            including:
            #um_d_5
            ANCIENT ALIENS!
        --- Life is good.#um_d_20
        ->DONE
        
        ->D14A2
//Could consider having checks fail as a toxic version? would mean writing two versions for most checks though...
//not working, not sure why    {perception >= 30}
* {perception >= 30} [You seemed spooked there for a moment, everything alright?]
    A: I'm not sleeping well. #us_perception_1
    A: Not since...
    A conversation about her insecurities and guilt over the paint thing follows...
    ->D14A2
// {perception < 30}
* {perception < 30} [Erm. Hm?]
    A: Nothing.
    ->D14A2


= D14A2
->DONE