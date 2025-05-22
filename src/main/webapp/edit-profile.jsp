<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile – Grab & Go</title>
    <link rel="stylesheet" type="text/css" href="css/edit-profile.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="edit-profile-container">
        <h2>Edit Your Profile</h2>
        
        <%-- Success Message Alert --%>
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">
                <span class="close">&times;</span>
                <c:out value="${successMessage}"/>
            </div>
        </c:if>
        
        <%-- Error Message --%>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-error">
                <span class="close">&times;</span>
                <c:out value="${errorMessage}"/>
            </div>
        </c:if>
        
        <form action="EditProfileServlet" method="post" enctype="multipart/form-data" id="profileForm">
            <div class="profile-picture-section">
                <c:set var="imagePath" value="images/${not empty user.image ? user.image : 'profile.png'}"/>
                <img src="${imagePath}" alt="Current Profile Picture" class="current-profile-pic" id="profilePreview">
                <div class="upload-container">
                    <input type="file" id="profileImage" name="profileImage" accept="image/*" onchange="previewImage(this)">
                    <label for="profileImage" class="upload-btn">Change Photo</label>
                </div>
            </div>
            
            <div class="form-group">
                <label for="firstName">First Name: <span class="required">*</span></label>
                <input type="text" id="firstName" name="firstName" value="${user.firstName}" required>
                <div class="error-message"></div>
            </div>
            
            <div class="form-group">
                <label for="lastName">Last Name: <span class="required">*</span></label>
                <input type="text" id="lastName" name="lastName" value="${user.lastName}" required>
                <div class="error-message"></div>
            </div>
            
            <div class="form-group">
                <label for="username">Username: <span class="required">*</span></label>
                <input type="text" id="username" name="username" value="${user.username}" required>
                <div class="error-message"></div>
            </div>
            
            <div class="form-group">
                <label for="password">New Password:</label>
                <input type="password" id="password" name="password" placeholder="Leave blank to keep current">
                <div class="error-message"></div>
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword">
                <div class="error-message"></div>
            </div>
            
            <div class="form-group">
                <label for="email">Email: <span class="required">*</span></label>
                <input type="email" id="email" name="email" value="${user.email}" required>
                <div class="error-message"></div>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone: <span class="required">*</span></label>
                <input type="tel" id="phone" name="phone" value="${user.phone}" required>
                <div class="error-message"></div>
            </div>
            
            <div class="form-group">
                <label for="address">Address: <span class="required">*</span></label>
                <textarea id="address" name="address" required><c:out value="${user.address}"/></textarea>
                <div class="error-message"></div>
            </div>
            
            <div class="form-group">
                <label>Gender: <span class="required">*</span></label>
                <div class="gender-options">
                    <input type="radio" id="male" name="gender" value="Male" ${user.gender eq 'Male' ? 'checked' : ''} required>
                    <label for="male">Male</label>
                    
                    <input type="radio" id="female" name="gender" value="Female" ${user.gender eq 'Female' ? 'checked' : ''}>
                    <label for="female">Female</label>
                    
                    <input type="radio" id="other" name="gender" value="Other" ${user.gender eq 'Other' ? 'checked' : ''}>
                    <label for="other">Other</label>
                </div>
                <div class="error-message"></div>
            </div>
            
            <div class="form-actions">
                <button type="submit" class="save-btn">Save Changes</button>
                <a href="ViewProfileServlet" class="cancel-btn">Cancel</a>
            </div>
        </form>
    </div>

    <%@ include file="footer.jsp" %>
    
    <script>
        function previewImage(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('profilePreview').src = e.target.result;
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        
        document.addEventListener('DOMContentLoaded', function() {
            // Close alert when X is clicked
            document.querySelectorAll('.alert .close').forEach(closeBtn => {
                closeBtn.addEventListener('click', function() {
                    this.parentElement.style.display = 'none';
                });
            });
            
            // Auto-hide success message after 5 seconds
            const successAlert = document.querySelector('.alert-success');
            if (successAlert) {
                setTimeout(() => {
                    successAlert.style.transition = 'opacity 0.5s ease';
                    successAlert.style.opacity = '0';
                    setTimeout(() => successAlert.remove(), 500);
                }, 5000);
            }
            
            const form = document.getElementById('profileForm');
            
            form.addEventListener('submit', function(e) {
                let isValid = true;
                
                // Clear previous errors
                document.querySelectorAll('.form-group').forEach(group => {
                    group.classList.remove('error');
                    const errorMsg = group.querySelector('.error-message');
                    if (errorMsg) errorMsg.textContent = '';
                });
                
                // Validate required fields
                const requiredFields = form.querySelectorAll('[required]');
                requiredFields.forEach(field => {
                    if (field.type === 'radio') {
                        const radioGroup = document.querySelectorAll(`input[name="${field.name}"]`);
                        const isChecked = Array.from(radioGroup).some(radio => radio.checked);
                        if (!isChecked) {
                            showError(radioGroup[0], 'Please select a gender');
                            isValid = false;
                        }
                    } else if (!field.value.trim()) {
                        showError(field, 'This field is required');
                        isValid = false;
                    }
                });
                
                // Validate email format
                const emailField = form.querySelector('input[type="email"]');
                if (emailField && emailField.value && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailField.value)) {
                    showError(emailField, 'Please enter a valid email address');
                    isValid = false;
                }
                
                // Validate password if provided
                const password = form.querySelector('#password');
                const confirmPassword = form.querySelector('#confirmPassword');
                
                if (password.value || confirmPassword.value) {
                    if (password.value.length < 6) {
                        showError(password, 'Password must be at least 6 characters');
                        isValid = false;
                    }
                    
                    if (password.value !== confirmPassword.value) {
                        showError(confirmPassword, 'Passwords do not match');
                        isValid = false;
                    }
                }
                
                if (!isValid) {
                    e.preventDefault();
                    // Scroll to first error
                    const firstError = document.querySelector('.error');
                    if (firstError) {
                        firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    }
                }
            });
            
            function showError(field, message) {
                const formGroup = field.closest('.form-group');
                if (formGroup) {
                    formGroup.classList.add('error');
                    const errorMsg = formGroup.querySelector('.error-message');
                    if (errorMsg) {
                        errorMsg.textContent = message;
                    }
                }
            }
        });
    </script>
</body>
</html>