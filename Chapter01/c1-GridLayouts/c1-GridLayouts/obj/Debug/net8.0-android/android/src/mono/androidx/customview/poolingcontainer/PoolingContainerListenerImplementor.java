package mono.androidx.customview.poolingcontainer;


public class PoolingContainerListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		androidx.customview.poolingcontainer.PoolingContainerListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onRelease:()V:GetOnReleaseHandler:AndroidX.CustomView.PoolingContainer.IPoolingContainerListenerInvoker, Xamarin.AndroidX.CustomView.PoolingContainer\n" +
			"";
		mono.android.Runtime.register ("AndroidX.CustomView.PoolingContainer.IPoolingContainerListenerImplementor, Xamarin.AndroidX.CustomView.PoolingContainer", PoolingContainerListenerImplementor.class, __md_methods);
	}


	public PoolingContainerListenerImplementor ()
	{
		super ();
		if (getClass () == PoolingContainerListenerImplementor.class) {
			mono.android.TypeManager.Activate ("AndroidX.CustomView.PoolingContainer.IPoolingContainerListenerImplementor, Xamarin.AndroidX.CustomView.PoolingContainer", "", this, new java.lang.Object[] {  });
		}
	}


	public void onRelease ()
	{
		n_onRelease ();
	}

	private native void n_onRelease ();

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
