package mono.com.google.android.material.animation;


public class AnimatableView_ListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.google.android.material.animation.AnimatableView.Listener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onAnimationEnd:()V:GetOnAnimationEndHandler:Google.Android.Material.Animation.IAnimatableViewListenerInvoker, Xamarin.Google.Android.Material\n" +
			"";
		mono.android.Runtime.register ("Google.Android.Material.Animation.IAnimatableViewListenerImplementor, Xamarin.Google.Android.Material", AnimatableView_ListenerImplementor.class, __md_methods);
	}


	public AnimatableView_ListenerImplementor ()
	{
		super ();
		if (getClass () == AnimatableView_ListenerImplementor.class) {
			mono.android.TypeManager.Activate ("Google.Android.Material.Animation.IAnimatableViewListenerImplementor, Xamarin.Google.Android.Material", "", this, new java.lang.Object[] {  });
		}
	}


	public void onAnimationEnd ()
	{
		n_onAnimationEnd ();
	}

	private native void n_onAnimationEnd ();

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
