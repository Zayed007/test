package com.samsung.android.companionservice.aidl.watchface;

import android.os.Parcel;
import android.os.Parcelable;

import java.util.ArrayList;

public class CategoryLists implements Parcelable {

    public static final String TAG_CATEGORY_ITEM = "CategoryItem";
    public static final String TAG_CATEGORY_NAME = "CategoryName";
    public static final String TAG_CATEGORY_TITLE = "CategoryTitle";
    public static final String TAG_CATEGORY_BG = "CategoryBG";
    public String mCategoryName;
    private String mCategoryTitle;
    private String mCategoryBG;
    public ArrayList<CategoryList> mCategoryContentList;

    public CategoryLists(String categoryName, ArrayList<CategoryList> list) {
        this.mCategoryName = categoryName;
        this.mCategoryContentList = list;
    }

    public CategoryLists(String categoryName, String title, String bg, ArrayList<CategoryList> list) {
        this.mCategoryName = categoryName;
        this.mCategoryTitle = title;
        this.mCategoryBG = bg;
        this.mCategoryContentList = list;
    }

    protected CategoryLists(Parcel in) {
        mCategoryName = in.readString();
        mCategoryTitle = in.readString();
        mCategoryBG = in.readString();
        mCategoryContentList = in.createTypedArrayList(CategoryList.CREATOR);
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(mCategoryName);
        dest.writeString(mCategoryTitle);
        dest.writeString(mCategoryBG);
        dest.writeTypedList(mCategoryContentList);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public void clear() {
        mCategoryName = null;
        mCategoryTitle = null;
        mCategoryBG = null;
        mCategoryContentList.clear();
    }

    public static final Creator<CategoryLists> CREATOR = new Creator<CategoryLists>() {
        @Override
        public CategoryLists createFromParcel(Parcel in) {
            return new CategoryLists(in);
        }

        @Override
        public CategoryLists[] newArray(int size) {
            return new CategoryLists[size];
        }
    };

    public void setCategoryName(String name) {
        this.mCategoryName = name;
    }

    public String getCategoryName() {
        return this.mCategoryName;
    }

    public void setCategoryTitle(String title) {
        this.mCategoryTitle = title;
    }

    public String getCategoryTitle() {
        return this.mCategoryTitle;
    }

    public void setCategoryBG(String bg) {
        this.mCategoryBG = bg;
    }

    public String getCategoryBG() {
        return this.mCategoryBG;
    }

    public void setCategoryContent(ArrayList<CategoryList> list) {
        this.mCategoryContentList = list;
    }

    public ArrayList<CategoryList> getCategoryContentList() {
        return this.mCategoryContentList;
    }
}
