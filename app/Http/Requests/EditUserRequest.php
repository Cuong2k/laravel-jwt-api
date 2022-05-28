<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EditUserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //
            'username' => 'required|string|min:2|max:100',
            'password' => 'required|string|min:6',
            'email' => 'required|email',

            'username.required' => 'Tên tài khoản không được bỏ trống',
            'username.string' => 'Phải là một chuỗi',
            'username.min' => 'Bạn cần nhập ít nhất 2 kí tự',
            'username.max' => 'Bạn chỉ được nhập nhiều nhất 50 kí tự',

            'password.required' => 'Mật khẩu không được bỏ trống',
            'password.string' => 'Phải là một chuỗi',
            'password.min' => 'Mật khẩu dài hơn 6 kí tự',

        ];
    }
    
    public function messages()
    {
        return [
            'username.required' => 'Tên tài khoản không được bỏ trống',
            'username.string' => 'Phải là một chuỗi',
            'username.min' => 'Bạn cần nhập ít nhất 2 kí tự',
            'username.max' => 'Bạn chỉ được nhập nhiều nhất 50 kí tự',
            
            'password.required' => 'Mật khẩu không được bỏ trống',
            'password.string' => 'Phải là một chuỗi',
            'password.min' => 'Mật khẩu dài hơn 6 kí tự',
            
            'email.email' => 'Cần nhập chuẩn định dạng email',
        ];
    }
}
