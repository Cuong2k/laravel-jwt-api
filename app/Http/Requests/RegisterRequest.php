<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
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
            'username' => 'required|string|min:2|max:100|unique:users',
            'email' => 'required|string|email|max:100|unique:users',
            'password' => 'required|string|confirmed|min:6',
        ];        
    }

    public function messages()
    {
        return [
            'username.required' => 'Không được bỏ trống trường này',
            'username.string' => 'Phải là một chuỗi',
            'username.unique' => 'Tên người dùng tồn tại',
            'username.min' => 'Bạn cần nhập ít nhất 2 kí tự',
            'username.max' => 'Bạn chỉ được nhập nhiều nhất 50 kí tự',


            'email.email' => 'Cần nhập chuẩn định dạng email',
            'email.unique' => 'Email tồn tại',

            'password.required' => 'Không được bỏ trống trường này',
            'password.string' => 'Phải là một chuỗi',
            'password.min' => 'Mật khẩu dài hơn 6 kí tự',
            'password.confirmed' => 'Xác nhận mật khẩu không đúng',

        ];
    }
}
