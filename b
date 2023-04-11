package com.samsung.android.waterplugin.watchface.presentation.viewmodel

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

import com.samsung.android.companionservice.aidl.watchface.CategoryLists
import com.samsung.android.waterplugin.watchface.data.model.Response
import com.samsung.android.waterplugin.watchface.util.WFLog

import com.samsung.android.waterplugin.watchface.data.repository.WatchFaceCategoryListRepository

import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.schedulers.Schedulers

/**
 * This is a view model class to observe extended watch faces and category watch faces
 *
 * @author  SK Tuhin Islam (sk.islam)
 * @since   2020-11-22
 */
class CategoryListViewModel : ViewModel() {

    private val TAG = "CategoryListViewModel"

    private val _categoryLists = MutableLiveData<Response<ArrayList<CategoryLists>?>>()
    val categoryLists: LiveData<Response<ArrayList<CategoryLists>?>>
        get() = _categoryLists

    private val disposable = CompositeDisposable()

    init {
        observeCategoryList()
    }
    override fun onCleared() {
        super.onCleared()

        WFLog.d(TAG, "onCleared()")
        disposable.dispose()
    }
    private fun observeCategoryList() {
        disposable.add(WatchFaceCategoryListRepository.watchFaceCategoryList
            .observeOn(AndroidSchedulers.mainThread())
            .subscribeOn(Schedulers.io())
            .subscribe({
                _categoryLists.postValue(Response.Success(it.value))
            }) {
                _categoryLists.postValue(Response.Error(it.message , it))
            })
    }
    fun getCategoryList() {
        WatchFaceCategoryListRepository.getWatchFaceCategoryLists()
    }
}
