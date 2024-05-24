package crc64a096dc44ad241142;


public class PlatformTicker_DurationScaleListener
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		android.animation.ValueAnimator.DurationScaleChangeListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onChanged:(F)V:GetOnChanged_FHandler:Android.Animation.ValueAnimator/IDurationScaleChangeListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n" +
			"";
		mono.android.Runtime.register ("Microsoft.Maui.Animations.PlatformTicker+DurationScaleListener, Microsoft.Maui", PlatformTicker_DurationScaleListener.class, __md_methods);
	}


	public PlatformTicker_DurationScaleListener ()
	{
		super ();
		if (getClass () == PlatformTicker_DurationScaleListener.class) {
			mono.android.TypeManager.Activate ("Microsoft.Maui.Animations.PlatformTicker+DurationScaleListener, Microsoft.Maui", "", this, new java.lang.Object[] {  });
		}
	}


	public void onChanged (float p0)
	{
		n_onChanged (p0);
	}

	private native void n_onChanged (float p0);

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
