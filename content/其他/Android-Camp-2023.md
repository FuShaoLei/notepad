## Section2：DataBinding

使用DataBinding

1. 在app的`build.gradle`文件中，添加

   ```
       buildFeatures {
           dataBinding = true
       }
   ```

2. `.xml`文件使用layout tag进行包裹，包括namespace要放在最外层

   ```xml
   <?xml version="1.0" encoding="utf-8"?>
   <layout xmlns:android="http://schemas.android.com/apk/res/android"
       xmlns:app="http://schemas.android.com/apk/res-auto"
       xmlns:tools="http://schemas.android.com/tools">
   
       <androidx.constraintlayout.widget.ConstraintLayout
           android:id="@+id/name_text"
           android:layout_width="match_parent"
           android:layout_height="match_parent"
           tools:context=".MainActivity">
   
           <TextView
               android:id="@+id/greeting_text_view"
                     ..../>
   
           <EditText
               android:id="@+id/name_edit_text"
                     ..../>
   
           <Button
               android:id="@+id/submit_button"
                   ..../>
   
       </androidx.constraintlayout.widget.ConstraintLayout>
   </layout>
   ```

3. 在Activity中，使用`DataBindingUtil.setContentView`

   ```kotlin
   class MainActivity : AppCompatActivity() {
       private lateinit var binding: ActivityMainBinding // ActivityMainBinding是根据xml文件名自动生成的
       override fun onCreate(savedInstanceState: Bundle?) {
           super.onCreate(savedInstanceState)
           binding = DataBindingUtil.setContentView(this, R.layout.activity_main)
           // 现在，可以不使用findviewbyid，直接binding.greetingTextView去使用
       }
   }
   ```

使用对象：

在`.xml`文件中

```xml
    
<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools">

    <data>

        <variable
            name="student"
            type="com.xx.Student" />
    </data>

    <androidx.constraintlayout.widget.ConstraintLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        tools:context=".MainActivity">


        <TextView
            android:id="@+id/control_button"
            android:text="@{student.name}"/>
    </androidx.constraintlayout.widget.ConstraintLayout>
</layout>

```

然后在activity中可以使用binding.setStudent来设置对象

## Section3: ViewModel

为了保持状态

简单使用

1. 添加依赖

   ```java
       def lifecycle_version = "2.5.1"
       // ViewModel
       implementation "androidx.lifecycle:lifecycle-viewmodel-ktx:$lifecycle_version"
       // LiveData
       implementation "androidx.lifecycle:lifecycle-livedata-ktx:$lifecycle_version"
       // 具体去https://developer.android.com/jetpack/androidx/releases/lifecycle查看最新版本
   ```

2. 继承ViewModel

   ```kotlin
   class MainActivityViewModel : ViewModel() {
   
       private var count = 0
   
       fun getCurrentCount(): Int {
           return count
       }
   
       fun getUpdateCount(): Int {
           return ++count
       }
   }
   ```

3. 在Activity中使用

   ```kotlin
   var viewModel = ViewModelProvider(this).get(MainActivityViewModel::class.java)
   binding.countText.text = viewModel.getCurrentCount().toString()
   binding.button.setOnClickListener {
       binding.countText.text = viewModel.getUpdateCount().toString()
   }
   ```

如果想要向viewmodel传递参数，则要使用到另外的方法

```kotlin
class MainActivityViewModelFactory(private val startingTotal: Int) : ViewModelProvider.Factory {

    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(MainActivityViewModel::class.java)) {
            return MainActivityViewModel(startingTotal) as T
        }
        throw IllegalAccessException("Unknown View Model Class")
    }
}
```

```kotlin
class MainActivityViewModel(startingTotal:Int) : ViewModel() {
    private var total = 0

    init {
        total = startingTotal
    }

    fun getTotal():Int{
        return total
    }

    fun setTotal(input:Int){
        total +=input
    }
}
```

```kotlin

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding
    private lateinit var viewModel: MainActivityViewModel
    private lateinit var viewModelFactory: MainActivityViewModelFactory

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_main)
        viewModelFactory = MainActivityViewModelFactory(123)
        viewModel = ViewModelProvider(this, viewModelFactory).get(MainActivityViewModel::class.java)
        binding.resultTextView.text = viewModel.getTotal().toString()

        binding.insertButton.setOnClickListener {
            viewModel.setTotal(binding.inputEditText.text.toString().toInt())
            binding.resultTextView.text = viewModel.getTotal().toString()

        }
    }
}
```



## Section4：Live Data

LiveData is a lifecycle-aware observable data holder class.

LiveData vs MutableLiveData

- Data in LiveData object are only readable,not editable
- A MutableLiveData object allows us to change/udpate its data

简单使用:

1. 定义

   ```kotlin
   class MainActivityViewModel : ViewModel() {
       var count = MutableLiveData<Int>()
   
       init {
           count.value = 0
       }
   
       fun updatedCount() {
           count.value = count.value?.plus(1)
       }
   }
   ```

2. 监听

   ```kotlin
   class MainActivity : AppCompatActivity() {
       private lateinit var binding: ActivityMainBinding
       private lateinit var viewModel: MainActivityViewModel
       override fun onCreate(savedInstanceState: Bundle?) {
           super.onCreate(savedInstanceState)
           binding = DataBindingUtil.setContentView(this, R.layout.activity_main)
           viewModel = ViewModelProvider(this).get(MainActivityViewModel::class.java)
   
           viewModel.count.observe(this) {
               binding.countText.text = it.toString()
           }
   
           binding.button.setOnClickListener {
               viewModel.updatedCount()
           }
       }
   }
   ```



LiveData的两种更新数据方式的区别

- setValue：只能在主线程中进行
- postValue：在任何线程中都可以



## Section5: ViewModel & LiveData and DataBinding

这节讲的其实是双向绑定

想要在`xml`文件中使用LiveData，要在Activity中设置

```kotlin
binding.lifecycleOwner = this
```

## Section6: Activity And Fragment Lifecycles

这章主要讲Activty和Fragment的生命周期，比较基本

