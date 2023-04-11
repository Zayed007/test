package com.samsung.android.companionservice.aidl.watchface;

import android.os.Parcel;
import android.os.Parcelable;

public class CategoryList implements Parcelable {
    public static final String TAG_APP_NAME = "AppName";
    public static final String TAG_APP_NAME_RSRC = "AppNameRsrc";
    public static final String TAG_PACKAGE_NAME = "PackageName";
    public static final String TAG_CLASS_NAME = "ClassName";
    public static final String TAG_IMAGE_FILE_NAME = "ImageFileName";
    public static final String TAG_DOWNLOAD = "DownLoad";

    private String mAppName;
    private String mAppNameRsrc;
    private String mPackageName;
    private String mClassName;
    private String mImageName;
    private boolean mIsDownload;
    private boolean mIsNeedTocheck;
    private boolean mShowOnlyIfPreloaded;

    private boolean mIsThirdParty;

    public CategoryList(String mAppName, String mAppNameRsrc, String mPackgageName, String mClassName, String mImageName, boolean mIsDownload) {
        this.mAppName = mAppName;
        this.mAppNameRsrc = mAppNameRsrc;
        this.mPackageName = mPackgageName;
        this.mClassName = mClassName;
        this.mImageName = mImageName;
        this.mIsDownload = mIsDownload;
        this.mIsNeedTocheck = false;
        this.mIsThirdParty = false;
    }
    public CategoryList(String mAppName, String mAppNameRsrc, String mPackgageName, String mClassName, String mImageName, boolean mIsDownload,boolean needTocheck, boolean isThirdParty) {
        this.mAppName = mAppName;
        this.mAppNameRsrc = mAppNameRsrc;
        this.mPackageName = mPackgageName;
        this.mClassName = mClassName;
        this.mImageName = mImageName;
        this.mIsDownload = mIsDownload;
        this.mIsNeedTocheck = needTocheck;
        this.mIsThirdParty = isThirdParty;
    }
    public CategoryList(String mAppName, String mAppNameRsrc, String mPackgageName, String mClassName, String mImageName, boolean mIsDownload, boolean needTocheck) {
        this.mAppName = mAppName;
        this.mAppNameRsrc = mAppNameRsrc;
        this.mPackageName = mPackgageName;
        this.mClassName = mClassName;
        this.mImageName = mImageName;
        this.mIsDownload = mIsDownload;
        this.mIsNeedTocheck = needTocheck;
        this.mIsThirdParty = false;
    }

    protected CategoryList(Parcel in) {
        this.mAppName = in.readString();
        this.mAppNameRsrc = in.readString();
        this.mPackageName = in.readString();
        this.mClassName = in.readString();
        this.mImageName = in.readString();
        this.mIsDownload = in.readByte()==1;
        this.mShowOnlyIfPreloaded = in.readByte() == 1;
        this.mIsNeedTocheck = in.readByte() == 1;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(mAppName);
        dest.writeString(mAppNameRsrc);
        dest.writeString(mPackageName);
        dest.writeString(mClassName);
        dest.writeString(mImageName);
        dest.writeByte((byte) (mIsDownload ? 1 : 0));
        dest.writeByte((byte) (mShowOnlyIfPreloaded ? 1 : 0));
        dest.writeByte((byte) (mIsNeedTocheck ? 1 : 0));
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public static final Creator<CategoryList> CREATOR = new Creator<CategoryList>() {
        @Override
        public CategoryList createFromParcel(Parcel in) {
            return new CategoryList(in);
        }

        @Override
        public CategoryList[] newArray(int size) {
            return new CategoryList[size];
        }
    };

    public final void readFromParcel(Parcel in) {
        this.mAppName = in.readString();
        this.mAppNameRsrc = in.readString();
        this.mPackageName = in.readString();
        this.mClassName = in.readString();
        this.mImageName = in.readString();
        this.mIsDownload = in.readByte()==1;
        this.mShowOnlyIfPreloaded = in.readByte() == 1;
        this.mIsNeedTocheck = in.readByte() == 1;
    }

    public void setPackageName(String packageName) {
        mPackageName = packageName;
    }

    public void setClassName(String className) {
        mClassName = className;
    }

    public void setAppName(String appName) {
        mAppName = appName;
    }

    public void setAppNameRsrc(String appNameRsrc) {
        mAppNameRsrc = appNameRsrc;
    }

    public void setImageName(String imageName) {
        mImageName = imageName;
    }

    public void setDownloadWatchFace(boolean isDownload) {
        mIsDownload = isDownload;
    }

    public String getPackageName() {
        return mPackageName;
    }

    public String getClassName() {
        return mClassName;
    }

    public String getAppName() {
        return mAppName;
    }

    public String getAppNameRsrc() {
        return mAppNameRsrc;
    }

    public String getImageName() {
        return mImageName;
    }

    public boolean getDownloadWatchFace() {
        return mIsDownload;
    }

    public boolean getShowOnlyWhenPreloaded(){
        return mShowOnlyIfPreloaded;
    }

    public boolean isNeedToCheck() {
        return mIsNeedTocheck;
    }

    public void clearCheckValue(){
        mIsNeedTocheck = false;
    }

    public boolean isThirdParty() {
        return mIsThirdParty;
    }
}

