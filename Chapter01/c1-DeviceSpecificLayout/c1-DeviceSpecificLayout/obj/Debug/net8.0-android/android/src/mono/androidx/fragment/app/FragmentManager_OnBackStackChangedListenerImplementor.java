package mono.androidx.fragment.app;


public class FragmentManager_OnBackStackChangedListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		androidx.fragment.app.FragmentManager.OnBackStackChangedListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onBackStackChanged:()V:GetOnBackStackChangedHandler:AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListenerInvoker, Xamarin.AndroidX.Fragment\n" +
			"n_onBackStackChangeCommitted:(Landroidx/fragment/app/Fragment;Z)V:GetOnBackStackChangeCommitted_Landroidx_fragment_app_Fragment_ZHandler:AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener, Xamarin.AndroidX.Fragment\n" +
			"n_onBackStackChangeStarted:(Landroidx/fragment/app/Fragment;Z)V:GetOnBackStackChangeStarted_Landroidx_fragment_app_Fragment_ZHandler:AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener, Xamarin.AndroidX.Fragment\n" +
			"";
		mono.android.Runtime.register ("AndroidX.Fragment.App.FragmentManager+IOnBackStackChangedListenerImplementor, Xamarin.AndroidX.Fragment", FragmentManager_OnBackStackChangedListenerImplementor.class, __md_methods);
	}


	public FragmentManager_OnBackStackChangedListenerImplementor ()
	{
		super ();
		if (getClass () == FragmentManager_OnBackStackChangedListenerImplementor.class) {
			mono.android.TypeManager.Activate ("AndroidX.Fragment.App.FragmentManager+IOnBackStackChangedListenerImplementor, Xamarin.AndroidX.Fragment", "", this, new java.lang.Object[] {  });
		}
	}


	public void onBackStackChanged ()
	{
		n_onBackStackChanged ();
	}

	private native void n_onBackStackChanged ();


	public void onBackStackChangeCommitted (androidx.fragment.app.Fragment p0, boolean p1)
	{
		n_onBackStackChangeCommitted (p0, p1);
	}

	private native void n_onBackStackChangeCommitted (androidx.fragment.app.Fragment p0, boolean p1);


	public void onBackStackChangeStarted (androidx.fragment.app.Fragment p0, boolean p1)
	{
		n_onBackStackChangeStarted (p0, p1);
	}

	private native void n_onBackStackChangeStarted (androidx.fragment.app.Fragment p0, boolean p1);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
