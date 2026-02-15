# 기본 Android ProGuard 규칙
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keepattributes InnerClasses

# kakao login
-keep class com.kakao.sdk.**.model.* { <fields>; }